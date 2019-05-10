require 'date'
require './model'


l49 = Series.where(name:'Grand Prix Legends').first
ctc = Series.where(name:'Classic Lotus Grand Prix').first

Plans.where(series_id:l49.id).each do |plan| plan.destroy end
Plans.where(series_id:ctc.id).each do |plan| plan.destroy end

Weeks.where(series_id:l49.id).each do |week| week.destroy end
Weeks.where(series_id:ctc.id).each do |week| week.destroy end

race_index = 1
race_date = Date.new(2019, 3, 12)

[ 'Watkins Glen International - Boot (2018-04-01 13:25 1x, 20 laps)',
  'Tsukuba Circuit - 2000 Full (2019-03-23 12:15 1x, 38 laps)',
  'Brands Hatch Circuit - Grand Prix (2019-04-01 13:10 1x, 25 laps)',
  'Virginia International Raceway - Full Course (2019-04-06 14:05 1x, 20 laps)',
  'Mount Panorama Circuit (2019-04-13 12:35 1x, 16 laps)',
  'Circuit Zolder - Alternate (2019-04-20 14:05 1x, 24 laps)',
  'Autodromo Nazionale Monza - GP without first chicane (2019-04-27 13:30 1x, 14 laps)',
  'Silverstone Circuit - National (2019-05-04 13:40 1x, 38 laps)',
  'Autódromo José Carlos Pace - Grand Prix (2019-05-11 12:30 1x, 22 laps)',
  'Road America - Bend (2019-05-18 14:25 1x, 16 laps)',
  'Indianapolis Motor Speedway - IndyCar Oval (2019-05-25 15:40 1x, 38 laps)',
  'Circuit Gilles Villeneuve (2019-06-01 14:40 1x, 22 laps)'
].each do |name|
  Weeks.create(:series_id => l49.id, :index => race_index,
               :track_name => name, :start => race_date)
  race_index = race_index + 1
  race_date = race_date + 7
end

race_index = 1
race_date = Date.new(2019, 3, 12)

[ 'Sebring International Raceway - International (2019-03-16 14:25 1x, 23 laps)',
  'Mid-Ohio Sports Car Course - Full Course (2019-04-01 17:55 1x, 35 laps)',
  'Autodromo Internazionale Enzo e Dino Ferrari Grand Prix (2019-03-30 12:40 1x, 27 laps)',
  'Donington Park Racing Circuit - National (201904-06 13:40 1x, 44 laps)',
  'Canadian Tire Motorsports Park (2019-04-13 13:50 1x, 38 laps)',
  'Circuit Park Zandvoort - Grand Prix (2019-04-20 13:45 1x, 30 laps)',
  'Silverstone Circuit - Grand Prix (2019-04-27 13:35 1x, 30 laps)',
  'Circuit de Spa-Francorchamps - Grand Prix Pits (2019-05-04 14:00 1x, 21 laps)',
  'Autodromo Nazionale Monza - GP without first chicane (2019-05-11 14:35 1x, 28 laps)',
  'Okayama International Circuit - Full Course (2019-05-18 14:05 1x, 32 laps)',
  'Detroit Grand Prix at Belle Isle - Belle Isle (201905-25 15:20 1x, 33 laps)',
  'WeatherTech Raceway at Laguna Seca - Full Course (2019-06-01 15:15 1x, 34 laps)'
].each do |name|
  Weeks.create(:series_id => ctc.id, :index => race_index,
               :track_name => name, :start => race_date)
  race_index = race_index + 1
  race_date = race_date + 7
end



