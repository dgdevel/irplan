require 'date'

require './model'

w13event = Events.create(
  :name => 'Classic Team Championship 2018 S1 Season Preview'
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'Indianapolis Motor Speedway, Road Course, 15 laps',
  :index => 1,
  :start => DateTime.new(2017,12,4,20,30)
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'Watkins Glen, Classic Boot, 14 laps',
  :index => 2,
  :start => DateTime.new(2017,12,6,20,30)
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'Nürburgring Nordschleife, Industriefahrten, 4 laps (late afternoon skybox)',
  :index => 3,
  :start => DateTime.new(2017,12,7,20,30)
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'Suzuka International Racing Course, Grand Prix, 12 laps',
  :index => 4,
  :start => DateTime.new(2017,12,8,20,30)
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'Mount Panorama Circuit, 11 laps',
  :index => 5,
  :start => DateTime.new(2017,12,9,14,30)
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'Road Atlanta, Full Course, 18 laps',
  :index => 6,
  :start => DateTime.new(2017,12,10,16,30)
)

