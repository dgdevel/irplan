require 'date'
require './model'


gt1 = Series.create(
  :name => 'Fanatec GT Challenge',
  :offset => 105,
  :step => 120,
  :official => 6
)

HighlightedWeekly.create(
  :series_id => gt1.id,
  :color => 'red',
  :name => 'Popular US timeslot',
  :index => 23
)

HighlightedWeekly.create(
  :series_id => gt1.id,
  :color => 'blue',
  :name => 'Popular AU timeslot',
  :index => 53
)

HighlightedWeekly.create(
  :series_id => gt1.id,
  :color => 'lightgreen',
  :name => 'Popular EU timeslot',
  :index => 57
)

HighlightedWeekly.create(
  :series_id => gt1.id,
  :color => 'lightgreen',
  :name => 'Popular EU timeslot',
  :index => 45
)

race_index = 1
race_date = Date.new(2019, 9, 10)

[ 'WeatherTech Raceway at Laguna Seca (2019-09-14 17:55 1x, 30 mins)',
  'Sebring International Raceway - International (2019-09-21 14:30 1x, 30 mins)',
  'Road America - Full (2019-09-28 13:00 1x, 30 mins)',
  'Silverstone Circuit - 2011 - Historical Grand Prix (2019-10-05 07:10 1x, 30 mins)',
  'Watkins Glen International - Boot (2019-10-12 09:15 1x, 30 mins)',
  'Mount Panorama Circuit (2019-10-19 18:00 1x, 30 mins)',
  'Summit Point Raceway (2019-10-26 13:20 1x, 30 mins)',
  'Autodromo Nazionale Monza - Grand Prix Without 1st chicane (2019-11-02 15:25 1x, 30 mins)',
  'Suzuka International Racing Course - Grand Prix (2019-11-09 08:15 1x, 30 mins)',
  'Okayama International Circuit - Full (2019-11-16 06:35 1x, 30 mins)',
  'Circuit de Spa-Francorchamps - Classic Pits (2019-11-23 12:50 1x, 30 mins)',
  'Circuit de Barcelona Catalunya - Grand Prix (2019-11-30 07:55 1x, 30 mins)'
].each do |name|
  Weeks.create(:series_id => gt1.id, :index => race_index,
               :track_name => name, :start => race_date)
  race_index = race_index + 1
  race_date = race_date + 7
end

