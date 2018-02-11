require './model'

ctc = Series.where(name:'Classic Lotus Grand Prix').first

HighlightedWeekly.create(
  :series_id => ctc.id,
  :color => 'orange',
  :name => 'Regular CTC weekend race',
  :index => 55
)

HighlightedWeekly.create(
  :series_id => ctc.id,
  :color => 'orange',
  :name => 'Regular CTC weekend race',
  :index => 56
)

HighlightedWeekly.create(
  :series_id => ctc.id,
  :color => 'orange',
  :name => 'Regular CTC weekend race',
  :index => 67
)

HighlightedWeekly.create(
  :series_id => ctc.id,
  :color => 'lightgreen',
  :name => 'CTC Broadcast race - aired on GSRC',
  :index => 68
)
