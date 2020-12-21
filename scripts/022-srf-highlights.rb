require 'date'
require './model'


srf = Series.where(name:'iRacing Spec Racer Ford Challenge').first

HighlightedWeekly.create(
  :series_id => srf.id,
  :color => 'red',
  :name => 'SoF Race',
  :index => 0
)

HighlightedWeekly.create(
  :series_id => srf.id,
  :color => 'blue',
  :name => 'Popular AU Race',
  :index => 5
)

