require './model'

l49 = Series.where(name:'Grand Prix Legends').first

HighlightedWeekly.create(
  :series_id => l49.id,
  :color => 'blue',
  :name => 'Popular AU timeslot',
  :index => 29
)

HighlightedWeekly.create(
  :series_id => l49.id,
  :color => 'orange',
  :name => 'Popular EU/US timeslot',
  :index => 33
)

HighlightedWeekly.create(
  :series_id => l49.id,
  :color => 'red',
  :name => 'GSRC Broadcast',
  :index => 54
)

HighlightedWeekly.create(
  :series_id => l49.id,
  :color => 'orange',
  :name => 'Popular EU/US timeslot',
  :index => 69
)

HighlightedWeekly.create(
  :series_id => l49.id,
  :color => 'orange',
  :name => 'Popular EU/US timeslot',
  :index => 81
)

