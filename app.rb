require 'cgi'
require 'sinatra'
require 'imgkit'

require './model'

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
    html = erb :planner_table, layout: false, locals: locals
    image_base = "public/s#{series.id}w#{week.id}"
    image = IMGKit.new(html)
    image.stylesheets << 'public/style.css'
    image.to_file("#{image_base}.png")
  end

  get '/planner' do
    locals = {
      series: Series.find(params[:series].to_i),
      week: Weeks.find(params[:week].to_i),
      plans: Plans.where(series_id: params[:series].to_i, weeks_id: params[:week].to_i),
      buttons: true
    }
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

