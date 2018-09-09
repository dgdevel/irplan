require 'date'
require './model'


l49 = Series.where(name:'Grand Prix Legends').first
ctc = Series.where(name:'Classic Lotus Grand Prix').first

Plans.where(series_id:l49.id).each do |plan| plan.destroy end
Plans.where(series_id:ctc.id).each do |plan| plan.destroy end

Weeks.where(series_id:l49.id).each do |week| week.destroy end
Weeks.where(series_id:ctc.id).each do |week| week.destroy end

race_index = 1
race_date = Date.new(2018, 9, 11)

[ 'Watkins Glen International - Classic Boot (Afternoon, 19 laps)',
  'Talladega Superspeedway (Afternoon, 45 laps)',
  'Brands Hatch Circuit - Grand Prix (Afternoon, 24 laps)',
  'Road America - Full Course (Afternoon, 16 laps)',
  'Autodromo Jose Carlos Pace - Grand Prix (Afternoon, 22 laps)',
  'Summit Point Raceway (Afternoon, 28 laps)',
  'Circuit Park Zandvoort - Grand Prix (Afternoon, 22 laps)',
  'Autodromo Internazionale Enzo e Dino Ferrari - Grand Prix (Afternoon, 20 laps)',
  'Circuit de Spa-Francorchamps - Classic Pits (Afternoon, 15 laps)',
  'Silverstone Circuit - Historical Grand Prix (Afternoon, 20 laps)',
  'Circuit des 24 Heures du Mans - Historic (Afternoon, 10 laps)',
  'Nurburgring Combined - Gesamtstrecke Long (Afternoon, 5 laps)'
].each do |name|
  Weeks.create(:series_id => l49.id, :index => race_index,
               :track_name => name, :start => race_date)
  race_index = race_index + 1
  race_date = race_date + 7
end

race_index = 1
race_date = Date.new(2018, 9, 11)

[ 'Silverstone Circuit - Historical Grand Prix (Afternoon, 29 laps)',
  'Autodromo Jose Carlos Pace - Grand Prix (Morning, 30 laps)',
  'Pocono Raceway - 2011 - International (Afternoon, 31 laps)',
  'Autodromo Nazionale Monza - GP without first chicane (Afternoon, 28 laps)',
  'Nurburgring Grand-Prix-Strecke - BES/WEC (Late Afternoon, 24 laps)',
  'Mount Panorama Circuit (Afternoon, 23 laps)',
  'Road America - Full Course (Late Afternoon, 22 laps)',
  'Detroit Grand Prix at Belle Isle - Belle Isle (Afternoon, 33 laps)',
  'Circuit de Spa-Francorchamps - Grand Prix Pits (Afternoon, 21 laps)',
  'Circuit des 24 Heures du Mans - 24 Heures du Mans (Morning, 12 laps)',
  'Autodromo Internazionale Enzo e Dino Ferrari - Moto (Afternoon, 27 laps)',
  'Canadian Tire Motorsport Park (Afternoon, 38 laps)'
].each do |name|
  Weeks.create(:series_id => ctc.id, :index => race_index,
               :track_name => name, :start => race_date)
  race_index = race_index + 1
  race_date = race_date + 7
end



