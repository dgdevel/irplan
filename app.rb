
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

require 'cgi'
require 'erb'
require 'ostruct'
require 'sinatra'
require 'imgkit'
require 'image_optim'
require 'sucker_punch'

require './model'

class ImageUpdaterJob
  include SuckerPunch::Job

  def perform(data)
    puts "ImageUpdaterJob.perform", data.inspect
    series = data[:series]
    car_classes = data[:car_classes]
    week = data[:week]
    plans = data[:plans]
    highlight = data[:highlight]
    buttons = false
    html = ERB.new(IO.read('views/planner_image.erb')).result(OpenStruct.new({
      :series => series,
      :car_classes => car_classes,
      :week => week,
      :plans => plans,
      :highlight => highlight,
      :buttons => false
    }).instance_eval { binding })
    image_base = "public/s#{series.id}w#{week.id}"
    image = IMGKit.new(html)
    image.stylesheets << 'public/style.css'
    image.to_file("#{image_base}.png")
    image_optim = ImageOptim.new(
      :pngout => false, :advpng => false, :optipng => false, :pngquant => false,
      :jhead => false, :jpegoptim => false,
      :svgo => false,
      :gifsicle => false)
    image_optim.optimize_image!("#{image_base}.png")
  end
end

class ImageEventUpdaterJob
  include SuckerPunch::Job

  def perform(data)
    puts "ImageEventUpdaterJob.perform", data.inspect
    event = data[:event]
    races = data[:races]
    plans = data[:plans]
    highlight = data[:highlight]
    html = ERB.new(IO.read('views/event_image.erb')).result(OpenStruct.new({
      :event => event,
      :races => races,
      :plans => plans,
      :highlight => highlight,
      :buttons => false
    }).instance_eval { binding })
    image_base = "public/e#{event.id}"
    image = IMGKit.new(html)
    image.stylesheets << "public/style.css"
    image.to_file("#{image_base}.png")
    image_optim = ImageOptim.new(
      :pngout => false, :advpng => false, :optipng => false, :pngquant => false,
      :jhead => false, :jpegoptim => false,
      :svgo => false,
      :gifsicle => false)
    image_optim.optimize_image!("#{image_base}.png")

  end

end

class App < Sinatra::Base

  configure do
    set :public_folder, "#{File.dirname __FILE__}/public"
  end

  def force_get_redirect(path)
    <<~HEREDOC
    <!doctype html>
    <meta http-equiv=refresh content="0; url=#{CGI.escapeHTML path}">
    HEREDOC
  end

  get '/' do
    redirect '/select_series', 302
  end

  get '/select_series' do
    series = Series.all.sort_by(&:name)
    erb :select_series, locals: {
      series: series
    }
  end

  get '/select_week' do
    series = Series.find(params[:series])
    weeks = Weeks.where(series_id: series.id).sort_by(&:index)
    erb :select_week, locals: {
      series: series,
      weeks: weeks
    }
  end

  def update_image(series, car_classes, week, plans, highlight)
    locals = {
      series: series,
      car_classes: car_classes,
      week: week,
      plans: plans,
      highlight: highlight,
      buttons: false
    }
    ImageUpdaterJob.perform_async(locals)
  end

  def update_event_image(event, races, plans)
    locals = {
      event: event,
      races: races,
      plans: plans,
      buttons: false
    }
    ImageEventUpdaterJob.perform_async(locals)
  end

  get '/image' do
    week = Weeks.where(series_id:params[:series].to_i, index:params[:week_index].to_i).first
    redirect "/s#{params[:series]}w#{week.id}.png", 302
  end

  get '/planner' do
    week = params[:week].to_i
    begin
      if week == 0
        week = Weeks.where(series_id:params[:series].to_i,index:params[:week_index].to_i).first.id
      end
      locals = {
        series: Series.find(params[:series].to_i),
        car_classes: CarClasses.where(series_id:params[:series].to_i),
        week: Weeks.find(week),
        plans: Plans.where(series_id: params[:series].to_i, weeks_id: week),
        highlight: HighlightedWeekly.where(series_id: params[:series].to_i),
        buttons: true
      }
      # generate image if does not exists
      imagefilename = "public/s#{locals[:series].id}w#{locals[:week].id}.png"
      puts "test existence #{imagefilename}"
      if not File.file?(imagefilename) then
        puts "file need to be generated!"
        update_image(locals[:series], locals[:car_classes], locals[:week], locals[:plans], locals[:highlight])
      end
      erb :planner, locals: locals
    rescue ActiveRecord::RecordNotFound => e
      return 410
    end
  end

  post '/add_my_plan' do
    Plans.create(
      series_id: params[:series].to_i,
      weeks_id: params[:week].to_i,
      driver_name: params[:driver_name],
      probability: params[:probability].to_i,
      race: params[:race].to_i,
      car_classes_id: params[:car_class].to_i
    )
    series = Series.find(params[:series].to_i)
    carClasses = CarClasses.where(series_id:params[:series].to_i)
    week = Weeks.find(params[:week].to_i)
    plans = Plans.where(series_id: params[:series].to_i, weeks_id: params[:week].to_i)
    highlight = HighlightedWeekly.where(series_id: params[:series].to_i)
    update_image(series, carClasses, week, plans, highlight)
    erb :planner_table, layout: false, locals: {
      series: series,
      car_classes: carClasses,
      week: week,
      plans: plans,
      highlight: highlight,
      buttons: true
    }
  end

  post '/remove_my_plan' do
    Plans.delete(params[:plan].to_i)
    series = Series.find(params[:series].to_i)
    carClasses = CarClasses.where(series_id:params[:series].to_i)
    week = Weeks.find(params[:week].to_i)
    plans = Plans.where(series_id: params[:series].to_i, weeks_id: params[:week].to_i)
    highlight = HighlightedWeekly.where(series_id: params[:series].to_i)
    update_image(series, carClasses, week, plans, highlight)
    erb :planner_table, layout: false, locals: {
      series: series,
      car_classes: carClasses,
      week: week,
      plans: plans,
      highlight: highlight,
      buttons: true
    }
  end

  get '/select_event' do
    erb :select_event, locals: {
      events: Events.all
    }
  end

  get '/event' do
    event = Events.find(params[:event].to_i)
    races = EventRaces.where(events_id: params[:event].to_i)
    plans = EventPlans.where(events_id: params[:event].to_i)
    imagefilename = "public/e#{event.id}.png"
    puts "test existence #{imagefilename}"
    if not File.file?(imagefilename) then
      puts "file need to be generated!"
      update_event_image(event, races, plans)
    end
    erb :event, locals: {
      event: event,
      races: races,
      plans: plans,
      buttons: true
    }
  end

  post '/add_my_event_plan' do
    EventPlans.create(
      events_id: params['event'].to_i,
      events_races_id: params['race'].to_i,
      driver_name: params['driver_name'],
      probability: params['probability'].to_i
    )
    event = Events.find(params[:event].to_i)
    races = EventRaces.where(events_id: params[:event].to_i)
    plans = EventPlans.where(events_id: params[:event].to_i)
    update_event_image(event, races, plans)
    erb :event_table, layout:false, locals: {
      event: event,
      races: races,
      plans: plans,
      buttons: true
    }
  end

  post '/remove_my_event_plan' do
    plan = EventPlans.find(params['plan'].to_i)
    event = Events.find(plan.events_id)
    races = EventRaces.where(events_id: plan.events_id)
    EventPlans.delete(params['plan'].to_i)
    plans = EventPlans.where(events_id: plan.events_id)
    update_event_image(event, races, plans)
    erb :event_table, layout:false, locals: {
      event: event,
      races: races,
      plans: plans,
      buttons: true
    }

  end

end

