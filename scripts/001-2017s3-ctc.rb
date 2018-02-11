# Encoding: utf-8

require 'date'

require './model'

ctc = Series.create(
  # series name
	:name => 'Classic Lotus Grand Prix',
  # offset from midnight for the first race, in minutes
	:offset => 30,
  # how many minutes between races
	:step => 120,
  # how many driver to get an official race
	:official => 6
)

# 2017s3 data

Weeks.create(:series_id => ctc.id, :index => 7,
	:track_name => 'Circuit of the Americas - Grand Prix (Afternoon)',
	:start => Date.new(2017, 7, 25))

Weeks.create(:series_id => ctc.id, :index => 8,
	:track_name => 'Nürburgring Nordschleife - Industriefahrten (Afternoon)',
	:start => Date.new(2017, 8, 1))

Weeks.create(:series_id => ctc.id, :index => 9,
	:track_name => 'Brands Hatch Circuit - Grand Prix (Afternoon)',
	:start => Date.new(2017, 8, 8))

Weeks.create(:series_id => ctc.id, :index => 10,
	:track_name => 'Phillip Island Circuit (Afternoon)',
	:start => Date.new(2017, 8, 15))

Weeks.create(:series_id => ctc.id, :index => 11,
	:track_name => 'Road Atlanta - Full Course (Afternoon)',
	:start => Date.new(2017, 8, 22))

Weeks.create(:series_id => ctc.id, :index => 12,
	:track_name => 'Suzuka International Racing Course - Grand Prix (Afternoon)',
	:start => Date.new(2017, 8, 29))
