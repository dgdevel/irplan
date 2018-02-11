require './model'

ctc = Series.where(name:'Classic Lotus Grand Prix').first

Series.update(ctc.id, :results => 'http://members.iracing.com/membersite/member/SeriesRaceResults.do?season=1913')

