# Encoding: utf-8

require 'date'

require './model'

ctc = Series.where(name:'Classic Lotus Grand Prix').first

Plans.where(series_id:ctc.id).each do |plan|
  plan.destroy
end

Weeks.where(series_id:ctc.id).each do |week|
  week.destroy
end

Weeks.create(:series_id => ctc.id, :index => 1,
	:track_name => 'Silverstone Circuit - Historical GP (29 laps)',
	:start => Date.new(2017, 9, 12))

Weeks.create(:series_id => ctc.id, :index => 2,
	:track_name => 'Sebring International Raceway - International Course (23 laps)',
	:start => Date.new(2017, 9, 19))

Weeks.create(:series_id => ctc.id, :index => 3,
	:track_name => 'Autodromo Internazionale Enzo e Dino Ferrari (27 laps)',
	:start => Date.new(2017, 9, 26))

Weeks.create(:series_id => ctc.id, :index => 4,
	:track_name => 'Snetterton - 200 Circuit (44 laps)',
	:start => Date.new(2017, 10, 2))

Weeks.create(:series_id => ctc.id, :index => 5,
	:track_name => 'Nürburgring Grand-Prix-Strecke - BES/WEC (24 laps)',
	:start => Date.new(2017, 10, 9))

Weeks.create(:series_id => ctc.id, :index => 6,
	:track_name => 'Circuit Park Zandvoort - Grand Prix (30 laps)',
	:start => Date.new(2017, 10, 16))

Weeks.create(:series_id => ctc.id, :index => 7,
	:track_name => 'Circuit des 24 Heures du Mans - 24 Heures du Mans (12 laps)',
	:start => Date.new(2017, 10, 23))

Weeks.create(:series_id => ctc.id, :index => 8,
	:track_name => 'Summit Point Raceway (42 laps)',
	:start => Date.new(2017, 10, 30))

Weeks.create(:series_id => ctc.id, :index => 9,
	:track_name => 'Canadian Tire Motorsport Park (38 laps)',
	:start => Date.new(2017, 11, 7))

Weeks.create(:series_id => ctc.id, :index => 10,
	:track_name => 'Donington Park Racing Circuit - National (44 laps)',
	:start => Date.new(2017, 11, 14))

Weeks.create(:series_id => ctc.id, :index => 11,
	:track_name => 'Circuit de Spa-Franchorchamps - Grand Prix Pits (21 laps)',
	:start => Date.new(2017, 11, 21))

Weeks.create(:series_id => ctc.id, :index => 12,
	:track_name => 'Autodromo Nazionale Monza - GP without first chicane (28 laps)',
	:start => Date.new(2017, 11, 28))

