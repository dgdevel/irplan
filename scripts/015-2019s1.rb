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

[ 'Watkins Glen International - Cup (31-Oct 12:52, 28 laps)',
  'Daytona International Speedway - 2007 - Road Course (22-Dec 12:24, 20 laps)',
  'Circuit des 24 Heures du Mans - Historic (30-Nov 12:49, 10 laps)',
  'Suzuka International Racing Course - Grand Prix (06-Jan 12:00, 16 laps)',
  'Barber Motorsport Park - Full Course (12-Jan 11:55, 25 laps)',
  'Mount Panorama Circuit (20-Jan 15:25, 16 laps)',
  'Donington Park Racing Circuit - Grand Prix (01-Apr 13:10, 24 laps)',
  'Road Atlanta - Full Course (02-Feb 12:50, 25 laps)',
  'Phillip Island Circuit (10-Feb 15:11, 24 laps)',
  'Lime Rock Park - Full Course (01-Apr 12:58, 40 laps)',
  'Circuit de Spa-Francorchamps - Classic Pits (01-Mar 12:50, 15 laps)',
  'Autodromo Nazionale Monza - Combined w/no chicanes (02-Mar 12:36, 15 laps)'
].each do |name|
  Weeks.create(:series_id => l49.id, :index => race_index,
               :track_name => name, :start => race_date)
  race_index = race_index + 1
  race_date = race_date + 7
end

race_index = 1
race_date = Date.new(2018, 9, 11)

[ 'Tsukuba Circuit - 2000 Full (16-Dec 11:37, 53 laps)',
  'Nuerburgring Nordschleife - Industriefahrten (30-Nov 12:22, 8 laps)',
  'Oulton Park Circuit - Intl w/no chicanes (30-Nov 12:00, 35 laps)',
  'Watkins Glen International - Classic Boot (01-Apr 13:12, 28 laps)',
  'Charlotte Motor Speedway - Roval (01-Apr 14:04, 39 laps)',
  'Road Atlanta - Full Course (19-Jan 09:42, 36 laps)',
  'Brands Hatch Circuit - Grand Prix (01-Apr 13:04, 37 laps)',
  'Circuit Zolder - Alternate (02-Feb 15:19, 35 laps)',
  'Barber Motorsport Park - Full Course (09-Feb 12:02, 35 laps)',
  'Circuit Gilles Villeneuve (01-Apr 08:35, 30 laps)',
  'Suzuka International Racing Course - Grand Prix (24-Feb 12:08, 23 laps)',
  'Phillip Island Circuit (03-Mar 18:38, 36 laps)'
].each do |name|
  Weeks.create(:series_id => ctc.id, :index => race_index,
               :track_name => name, :start => race_date)
  race_index = race_index + 1
  race_date = race_date + 7
end



