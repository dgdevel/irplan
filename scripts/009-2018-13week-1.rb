require 'date'

require './model'

w13event = Events.create(
  :name => 'Classic Team Championship 2018 S2 Season Preview'
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'Autodromo Nazionale Monza (GP without first chicane, 14 laps)',
  :index => 1,
  :start => DateTime.new(2018,3,5,20,30)
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'Autodromo Internazionale Enzo e Dino Ferrari (Grand Prix, 14 laps)',
  :index => 2,
  :start => DateTime.new(2018,3,7,20,30)
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'Pocono Raceway circa 2011 (International, 15 laps)',
  :index => 3,
  :start => DateTime.new(2018,3,8,20,30)
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'Okayama International Circuit (Full Course, 16 laps)',
  :index => 4,
  :start => DateTime.new(2018,3,9,20,30)
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'Circuit de Spa-Francorchamps (Classic Pits, 11 laps)',
  :index => 5,
  :start => DateTime.new(2018,3,10,14,30)
)

EventRaces.create(
  :events_id => w13event.id,
  :track_name => 'Mazda Raceway Laguna Seca (Full Course, 17 laps)',
  :index => 6,
  :start => DateTime.new(2018,3,11,16,30)
)

