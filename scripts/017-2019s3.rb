require 'date'
require './model'


l49 = Series.where(name:'Grand Prix Legends').first
ctc = Series.where(name:'Classic Lotus Grand Prix').first
kam = Series.create(
  :name => 'Kamel GT Championship',
  :offset => 60,
  :step => 120,
  :official => 8
)

CarClasses.create(
  :series_id => kam.id,
  :name => 'GTP (Nissan GTP XZ-T)',
  :shortname => 'GTP'
)

CarClasses.create(
  :series_id => kam.id,
  :name => 'GTO (Audi 90 GTO)',
  :shortname => 'GTO'
)


HighlightedWeekly.create(
  :series_id => kam.id,
  :color => 'orange',
  :name => 'Popular timeslot',
  :index => 36
)

HighlightedWeekly.create(
  :series_id => kam.id,
  :color => 'orange',
  :name => 'Popular timeslot',
  :index => 46
)

HighlightedWeekly.create(
  :series_id => kam.id,
    :color => 'lightgreen',
  :name => 'Broadcasted on GSRC',
  :index => 56
)

HighlightedWeekly.create(
  :series_id => kam.id,
  :color => 'orange',
  :name => 'Popular timeslot',
  :index => 69
)

Plans.where(series_id:l49.id).each do |plan| plan.destroy end
Plans.where(series_id:ctc.id).each do |plan| plan.destroy end

Weeks.where(series_id:l49.id).each do |week| week.destroy end
Weeks.where(series_id:ctc.id).each do |week| week.destroy end

race_index = 1
race_date = Date.new(2019, 6, 11)

[ 'Mount Panorama Circuit (2019-06-15 12:25 1x, 40 mins)',
  'Circuit Zolder - Alternate (2019-06-22 07:55 1x, 40 mins)',
  'Snetterton Circuit - 100 (2019-06-29 14:05 1x, 40 mins)',
  'Autodromo Jose Carlos Pace - Grand Prix (2019-07-06 12:40 1x, 60 mins)',
  'Autodromo Nazionale Monza - GP without chicanes (2019-07-13 19:30 1x, 40 mins)',
  'Road Atlanta - Full Course (2019-07-20 08:25 1x, 40 mins)',
  'Lime Rock Park - Full Course (2019-07-27 18:45 1x, 40 mins)',
  'Detroit Grand Prix at Belle Isle - Belle Isle (2019-08-03 15:10 1x, 40 mins)',
  'Okayama International Circuit - Full Course (2019-08-10 07:00 1x, 40 mins)',
  'Watkins Glen International - Classic Boot (2019-08-17 14:15 1x, 60 mins)',
  'Donington Park Racing Circuit - Grand Prix(2019-08-24 08:20 1x, 40 mins)',
  'Circuit Gilles Villeneuve (2019-08-31 18:05 1x, 40 mins)'
].each do |name|
  Weeks.create(:series_id => kam.id, :index => race_index,
               :track_name => name, :start => race_date)
  race_index = race_index + 1
  race_date = race_date + 7
end

race_index = 1
race_date = Date.new(2019, 6, 11)

[ 'Circuit des 24 Heures du Mans - Historic (2019-06-15 15:40 1x, 10 laps)',
  'WeatherTech Raceway at Laguna Seca - FullCourse (2019-06-22 15:25 1x, 24 laps)',
  'Oulton Park Circuit - Intl w/no Chicanes (2019-06-29 14:10 1x, 24 laps)',
  'Twin Ring Motegi - Grand Prix (2019-07-0613:55 1x, 18 laps)',
  'Silverstone Circuit - 2011 - Historical Grand Prix(2019-07-13 14:05 1x, 20 laps)',
  'Indianapolis Motor Speedway - Road Course(2019-07-20 15:50 1x, 23 laps)',
  'Nürburgring Nordschleife - Industriefahrten(2019-07-27 14:15 1x, 5 laps)',
  'Canadian Tire Motorsports Park (2019-08-0314:45 1x, 25 laps)',
  'Oran Park Raceway - Grand Prix (2019-08-1012:20 1x, 28 laps)',
  'Pocono Raceway - 2011 - Oval (2019-08-1714:20 1x, 38 laps)',
  'Okayama International Circuit - Full Course(2019-08-24 13:40 1x, 22 laps)',
  'Circuit de Spa-Francorchamps - Classic Pits(2019-08-31 14:00 1x, 14 laps)'
].each do |name|
  Weeks.create(:series_id => l49.id, :index => race_index,
               :track_name => name, :start => race_date)
  race_index = race_index + 1
  race_date = race_date + 7
end

race_index = 1
race_date = Date.new(2019, 6, 11)

[ 'Silverstone Circuit - Grand Prix (2019-06-1512:00 1x, 20 laps)',
  'Autódromo José Carlos Pace - Grand Prix(2019-06-22 12:45 1x, 30 laps)',
  'Watkins Glen International - Boot (2019-06-2912:00 1x, 28 laps)',
  'Road Atlanta - Full Course (2019-07-06 08:15 1x, 36 laps)',
  'Road America - Full Course (2019-07-13 12:00 1x, 22 laps)',
  'Mount Panorama Circuit (2019-07-20 12:45 1x, 23 laps)',
  'Oulton Park Circuit - Intl w/no Chicanes (2019-07-27 13:30 1x, 35 laps)',
  'Nürburgring Nordschleife - Industriefahrten(2019-08-03 14:00 1x, 8 laps)',
  'Sonoma Raceway - Long (2019-08-10 12:00 1x, 32 laps)',
  'Virginia International Raceway - Full Course(2019-08-17 08:20 1x, 26 laps)',
  'Circuit of the Americas - Grand Prix (2019-08-2412:00 1x, 22 laps)',
  'Suzuka International Racing Course - Grand Prix(2019-08-31 13:15 1x, 23 laps)'
].each do |name|
  Weeks.create(:series_id => ctc.id, :index => race_index,
               :track_name => name, :start => race_date)
  race_index = race_index + 1
  race_date = race_date + 7
end

