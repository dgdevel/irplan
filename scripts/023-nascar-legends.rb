require 'date'
require './model'


srf = Series.create(
  :name => 'NASCAR Legends Series',
  :offset => 90,
  :step => 120,
  :official => 6
)

race_index = 1
race_date = Date.new(2021, 3, 16)

[ '[Legacy] Daytona International Speedway - 2008 - Oval (2021-03-20 14:25, 60 laps)',
  'Atlanta Motor Speedway - Oval (2021-03-27 14:20, 90 laps)',
  'North Wilkesboro Speedway - 1987 (2021-04-03 12:00, 120 laps)',
  'Bristol Motor Speedway - Dual Pit Roads (2021-04-10 14:35, 150 laps)',
  'Darlington Raceway (2021-04-17 12:20, 90 laps)',
  'Martinsville Speedway (2021-04-24 14:50, 130 laps)',
  'Talladega Superspeedway (2021-05-01 12:00, 60 laps)',
  '[Legacy] Michigan International Speedway - 2009 (2021-05-08 15:05, 60 laps)',
  '[Legacy] Silverstone Circuit - 2008 - Historical Grand Prix (2021-05-15 12:00, 25 laps)',
  'Charlotte Motor Speedway - Oval - 2018 (2021-05-22 19:00, 90 laps)',
  'Dover International Speedway (2021-05-29 15:05, 90 laps)',
  '[Legacy] Pocono Speedway - 2009 - Oval (2021-06-05 15:05, 50 laps)'
].each do |name|
  Weeks.create(:series_id => srf.id, :index => race_index,
               :track_name => name, :start => race_date)
  race_index = race_index + 1
  race_date = race_date + 7
end

