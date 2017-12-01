require 'date'

require './model'

w13event = Events.create(
  :name => 'Lotus 79 - 13th week event'
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'track 1',
  :index => 1,
  :start => DateTime.new(2017,12,5,20,30)
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'track 2',
  :index => 2,
  :start => DateTime.new(2017,12,6,20,30)
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'track 3',
  :index => 3,
  :start => DateTime.new(2017,12,7,20,30)
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'track 4',
  :index => 4,
  :start => DateTime.new(2017,12,8,20,30)
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'track 5',
  :index => 5,
  :start => DateTime.new(2017,12,9,14,30)
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'track 6',
  :index => 6,
  :start => DateTime.new(2017,12,10,16,30)
)

