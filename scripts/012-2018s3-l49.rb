require 'date'

require './model'

l49 = Series.create(
	:name => 'Grand Prix Legends',
	:offset => 90,
	:step => 120,
	:official => 6
)

Weeks.create(:series_id => l49.id, :index => 1,
	:track_name => 'Okayama International Circuit - Full Course (Afternoon, 22 laps)',
	:start => Date.new(2018,  6, 12))

Weeks.create(:series_id => l49.id, :index => 2,
	:track_name => 'Sebring International Raceway - International (Afternoon, 16 laps)',
	:start => Date.new(2018,  6, 19))

Weeks.create(:series_id => l49.id, :index => 3,
	:track_name => 'Sonoma Raceway - Cup (Afternoon, 20 laps)',
	:start => Date.new(2018,  6, 26))

Weeks.create(:series_id => l49.id, :index => 4,
	:track_name => 'Detroit Grand Prix Belle Isle - Belle Isle (Afternoon, 20 laps)',
	:start => Date.new(2018,  7,  3))

Weeks.create(:series_id => l49.id, :index => 5,
	:track_name => 'Road America - Full Course (Afternoon, 16 laps)',
	:start => Date.new(2018,  7, 10))

Weeks.create(:series_id => l49.id, :index => 6,
	:track_name => 'Oulton Park Circuit - Intl w/no Chicahes (Afternoon, 24 laps)',
	:start => Date.new(2018,  7, 17))

Weeks.create(:series_id => l49.id, :index => 7,
	:track_name => 'Autodromo Nazionale Monza - Combined without chicanes (Afternoon, 16 laps)',
	:start => Date.new(2018,  7, 24))

Weeks.create(:series_id => l49.id, :index => 8,
	:track_name => 'Mount Panorama Circuit (Afternoon, 15 laps)',
	:start => Date.new(2018,  7, 31))

Weeks.create(:series_id => l49.id, :index => 9,
	:track_name => 'Mazda Raceway Laguna Seca - Full Course (Afternoon, 24 laps)',
	:start => Date.new(2018,  8,  7))

Weeks.create(:series_id => l49.id, :index => 10,
	:track_name => 'Watkins Glen International - Boot (Afternoon, 18 laps)',
	:start => Date.new(2018,  8, 14))

Weeks.create(:series_id => l49.id, :index => 11,
	:track_name => 'Canadian Tire Motorsports Park (Afternoon, 25 laps)',
	:start => Date.new(2018,  8, 21))

Weeks.create(:series_id => l49.id, :index => 12,
	:track_name => 'Circuit de Spa-Francorchamps - Classic Pits (Afternoon, 15 laps)',
	:start => Date.new(2018,  8, 28))



