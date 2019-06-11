require 'date'
require './model'


gps = Series.create(
  :name => 'iRacing Grand Prix Series',
  :offset => 0,
  :step => 120,
  :official => 6
)

HighlightedWeekly.create(
  :series_id => gps.id,
  :color => 'lightgreen',
  :name => 'Broadcasted on GSRC',
  :index => 67
)

race_index = 1
race_date = Date.new(2019, 6, 11)

[ 'Circuit Gilles Villeneuve(2019-06-15 14:45 1x, 46 laps)',
  'Autódromo José Carlos Pace - Grand Prix(2019-06-22 12:45 1x, 47 laps)',
  'Phillip Island Circuit(2019-06-29 10:00 1x, 45 laps)',
  'Suzuka International Racing Course - Grand Prix(2019-07-06 17:45 1x, 35 laps)',
  'Silverstone Circuit - Grand Prix(2019-07-13 14:05 1x, 52 laps)',
  'Detroit Grand Prix at Belle Isle - Belle Isle(2019-07-20 08:10 1x, 53 laps)',
  'Nürburgring Grand-Prix-Strecke - Grand Prix(2019-07-27 08:10 1x, 59 laps)',
  'Indianapolis Motor Speedway - Road Course(2019-08-03 15:35 1x, 48 laps)',
  'Autodromo Nazionale Monza - Grand Prix(2019-08-10 19:05 1x, 35 laps)',
  'Twin Ring Motegi - Grand Prix(2019-08-17 13:20 1x, 35 laps)',
  'Road America - Full Course(2019-08-24 18:15 1x, 31 laps)',
  'Circuit de Spa-Francorchamps - Grand Prix Pits(2019-08-31 14:00 1x, 43 laps)'
].each do |name|
  Weeks.create(:series_id => gps.id, :index => race_index,
               :track_name => name, :start => race_date)
  race_index = race_index + 1
  race_date = race_date + 7
end

