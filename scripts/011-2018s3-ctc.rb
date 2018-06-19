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
            :track_name => 'Watkins Glen International - Classic Boot (Afternoon, 28 laps)',
            :start => Date.new(2018, 6, 12))

Weeks.create(:series_id => ctc.id, :index => 2,
            :track_name => 'Sebring International Raceway - International (Afternoon, 23 laps)',
            :start => Date.new(2018, 6, 19))

Weeks.create(:series_id => ctc.id, :index => 3,
            :track_name => 'Virginia International Raceway - Full Course (Morning, 26 laps)',
            :start => Date.new(2018, 6, 26))

Weeks.create(:series_id => ctc.id, :index => 4,
            :track_name => 'Detroit Grand Prix at Belle Isle - Belle Isle (Afternoon, 33 laps)',
            :start => Date.new(2018, 7, 3))

Weeks.create(:series_id => ctc.id, :index => 5,
            :track_name => 'Oulton Park Circuit - Intl w/no Chicanes (Afternoon, 34 laps)',
            :start => Date.new(2018, 7, 10))

Weeks.create(:series_id => ctc.id, :index => 6,
            :track_name => 'Circuit Park Zandvoort - Grand Prix (Afternoon, 30 laps)',
            :start => Date.new(2018, 7, 17))

Weeks.create(:series_id => ctc.id, :index => 7,
            :track_name => 'Donington Park Racing Circuit - Grand Prix (Late Afternoon, 32 laps)',
            :start => Date.new(2018, 7, 24))

Weeks.create(:series_id => ctc.id, :index => 8,
            :track_name => 'Nuerburgring Nordschleife - Industriefahrten (Morning, 8 laps)',
            :start => Date.new(2018, 7, 31))

Weeks.create(:series_id => ctc.id, :index => 9,
            :track_name => 'Twin Ring Motegi - Grand Prix (Late Afternoon, 26 laps)',
            :start => Date.new(2018, 8, 7))

Weeks.create(:series_id => ctc.id, :index => 10,
            :track_name => 'Suzuka International Racing Course - Grand Prix (Afternoon, 23 laps)',
            :start => Date.new(2018, 8, 14))

Weeks.create(:series_id => ctc.id, :index => 11,
            :track_name => 'Circuit of the Americas - Grand Prix (Late Afternoon, 22 laps)',
            :start => Date.new(2018, 8, 21))

Weeks.create(:series_id => ctc.id, :index => 12,
            :track_name => 'Road Atlanta - Full Course (Afternoon, 36 laps)',
            :start => Date.new(2018, 8, 28))


