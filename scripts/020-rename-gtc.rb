require 'date'

require './model'

gtc = Series.find_by(name:'Fanatec GT Challenge')
puts gtc.name
gtc.name = 'Heusinkveld GT Challenge'
gtc.save()
