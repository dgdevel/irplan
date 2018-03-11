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
            :track_name => 'Mazda Raceway Laguna Seca - Full Course (34 laps)',
            :start => Date.new(2018, 3, 13))

Weeks.create(:series_id => ctc.id, :index => 2,
            :track_name => 'Circuit de Spa-Francorchamps - Classic Pits (21 laps)',
            :start => Date.new(2018, 3, 20))

Weeks.create(:series_id => ctc.id, :index => 3,
            :track_name => 'Mid-Ohio Sports Car Course - Full Course (35 laps)',
            :start => Date.new(2018, 3, 27))

Weeks.create(:series_id => ctc.id, :index => 4,
            :track_name => 'Okayama International Circuit - Full Course (32 laps)',
            :start => Date.new(2018, 4, 3))

Weeks.create(:series_id => ctc.id, :index => 5,
            :track_name => 'Phillip Island Circuit (36 laps)',
            :start => Date.new(2018, 4,10))

Weeks.create(:series_id => ctc.id, :index => 6,
            :track_name => 'Autodromo Internazionale Enzo e Dino Ferrari - Grand Prix (27 laps)',
            :start => Date.new(2018, 4,17))

Weeks.create(:series_id => ctc.id, :index => 7,
            :track_name => 'Brands Hatch Circuit - Grand Prix (36 laps)',
            :start => Date.new(2018, 4,24))

Weeks.create(:series_id => ctc.id, :index => 8,
            :track_name => 'Indianapolis Motor Speedway - Road Course (33 laps)',
            :start => Date.new(2018, 5, 1))

Weeks.create(:series_id => ctc.id, :index => 9,
            :track_name => 'Circuit Gilles Villeneuve (30 laps)',
            :start => Date.new(2018, 5, 8))

Weeks.create(:series_id => ctc.id, :index => 10,
            :track_name => 'Silverstone Circuit - Historical Grand Prix (29 laps)',
            :start => Date.new(2018, 5,15))

Weeks.create(:series_id => ctc.id, :index => 11,
            :track_name => 'Canadian Tire Motorsport Park (38 laps)',
            :start => Date.new(2018, 5,22))

Weeks.create(:series_id => ctc.id, :index => 12,
            :track_name => 'Autodromo Nazionale Monza - GP without first chicane (28 laps)',
            :start => Date.new(2018, 5, 29))


