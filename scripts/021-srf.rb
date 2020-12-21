require 'date'
require './model'


srf = Series.create(
  :name => 'iRacing Spec Racer Ford Challenge',
  :offset => 45,
  :step => 120,
  :official => 6
)

race_index = 1
race_date = Date.new(2020, 12, 15)

[ 'Oran Park Raceway - Grand Prix (2020-12-19 07:30)',
  'Mount Panorama Circuit (2020-12-26 12:00)',
  'Suzuka International Racing Course - Grand Prix (2021-01-02 07:05)',
  'Long Beach Street Circuit (2021-01-09 09:00)',
  'Lime Rock Park - Grand Prix (2021-04-01 14:00)',
  'Road America - Full Course (2021-04-01 15:15)',
  'Charlotte Motor Speedway - Roval (2021-04-01 08:50)',
  'Autodromo Nazionale Monza - Junior (2021-02-06 13:20)',
  'Autodromo Internazionale Enzo e Dino Ferrari - Grand Prix (2021-04-01 12:00)',
  'Circuit Gilles Villeneuve (2021-04-01 13:15)',
  'WeatherTech Raceway at Laguna Seca - Full Course (2021-02-27 14:15)',
  'Sebring International Raceway - Club (2021-03-06 12:00)'
].each do |name|
  Weeks.create(:series_id => srf.id, :index => race_index,
               :track_name => name, :start => race_date)
  race_index = race_index + 1
  race_date = race_date + 7
end

