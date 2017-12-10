require 'date'

require './model'

ctc = Series.where(name:'Classic Lotus Grand Prix').first

Plans.where(series_id:ctc.id).each do |plan|
  plan.destroy
end

Weeks.where(series_id:ctc.id).each do |week|
  week.destroy
end

Weeks.create(:series_id => ctc.id, :index => 1,
            :track_name => 'Road Atlanta - Full Course (Afternoon, 36 laps) ',
            :start => Date.new(2017,12,12))

Weeks.create(:series_id => ctc.id, :index => 2,
            :track_name => 'Mount Panorama Circuit (Afternoon, 23 laps)',
            :start => Date.new(2017,12,19))

Weeks.create(:series_id => ctc.id, :index => 3,
            :track_name => 'Snetterton Circuit - 300 (Late Afternoon, 26 laps)',
            :start => Date.new(2017,12,26))

Weeks.create(:series_id => ctc.id, :index => 4,
            :track_name => 'Road America - Full Course (Afternoon, 22 laps)',
            :start => Date.new(2018, 1, 2))

Weeks.create(:series_id => ctc.id, :index => 5,
            :track_name => 'Sonoma Raceway - Long (Afternoon, 32 laps)',
            :start => Date.new(2018, 1, 9))

Weeks.create(:series_id => ctc.id, :index => 6,
            :track_name => 'Barber Motorsport Park - Full Course (Afternoon, 35 laps)',
            :start => Date.new(2018, 1,16))

Weeks.create(:series_id => ctc.id, :index => 7,
            :track_name => 'Oulton Park Circuit - Intl w/no Chicanes (Afternoon, 34 laps)',
            :start => Date.new(2018, 1,23))

Weeks.create(:series_id => ctc.id, :index => 8,
            :track_name => 'Circuit Park Zandvoort - Grand Prix (Morning, 34 laps)',
            :start => Date.new(2018, 1,30))

Weeks.create(:series_id => ctc.id, :index => 9,
            :track_name => 'Nuerburgring Nordschleife - Industriefahrten (Late Afternoon, 8 laps)',
            :start => Date.new(2018, 2, 6))

Weeks.create(:series_id => ctc.id, :index => 10,
            :track_name => 'Watkins Glen International - Classic Boot (Afternoon, 28 laps)',
            :start => Date.new(2018, 2,13))

Weeks.create(:series_id => ctc.id, :index => 11,
            :track_name => 'Suzuka International Racing Course - Grand Prix (Afternoon, 23 laps)',
            :start => Date.new(2018, 2,20))

Weeks.create(:series_id => ctc.id, :index => 12,
            :track_name => 'Autodromo Jose Carlos Pace - Grand Prix (Afternoon, 30 laps)',
            :start => Date.new(2018, 2,27))


