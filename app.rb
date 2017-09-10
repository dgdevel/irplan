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
    week = data[:week]
    plans = data[:plans]
    buttons = false
    html = ERB.new(IO.read('views/planner_image.erb')).result(OpenStruct.new({
      :series => series,
      :week => week,
      :plans => plans,
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
    series = Series.all
    erb :select_series, locals: {
      series: series
    }
  end

  get '/select_week' do
    series = Series.find(params[:series])
    weeks = Weeks.all
    erb :select_week, locals: {
      series: series,
      weeks: weeks
    }
  end

  def update_image(series, week, plans)
    locals = {
      series: series,
      week: week,
      plans: plans,
      buttons: false
    }
    ImageUpdaterJob.perform_async(locals)
  end

  get '/planner' do
    locals = {
      series: Series.find(params[:series].to_i),
      week: Weeks.find(params[:week].to_i),
      plans: Plans.where(series_id: params[:series].to_i, weeks_id: params[:week].to_i),
      buttons: true
    }
    # generate image if does not exists
    imagefilename = "public/s#{locals[:series].id}w#{locals[:week].id}.png"
    puts "test existence #{imagefilename}"
    if not File.file?(imagefilename) then
      puts "file need to be generated!"
      update_image(locals[:series], locals[:week], locals[:plans])
    end
    erb :planner, locals: locals
  end

  post '/add_my_plan' do
    Plans.create(
      series_id: params[:series].to_i,
      weeks_id: params[:week].to_i,
      driver_name: params[:driver_name],
      probability: params[:probability].to_i,
      race: params[:race].to_i
    )
    series = Series.find(params[:series].to_i)
    week = Weeks.find(params[:week].to_i)
    plans = Plans.where(series_id: params[:series].to_i, weeks_id: params[:week].to_i)
    update_image(series, week, plans)
    erb :planner_table, layout: false, locals: {
      series: series,
      week: week,
      plans: plans,
      buttons: true
    }
  end

  post '/remove_my_plan' do
    Plans.delete(params[:plan].to_i)
    series = Series.find(params[:series].to_i)
    week = Weeks.find(params[:week].to_i)
    plans = Plans.where(series_id: params[:series].to_i, weeks_id: params[:week].to_i)
    update_image(series, week, plans)
    erb :planner_table, layout: false, locals: {
      series: series,
      week: week,
      plans: plans,
      buttons: true
    }
  end

end

