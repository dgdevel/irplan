
if ARGV.length == 0
  puts "Usage: ruby season-loader.rb [input.csv] [date yyyy-mm-dd]"
  exit 1
end

require 'date'
require 'csv'
require './model'

input_file = ARGV[0]
first_day  = Date.strptime(ARGV[1], '%Y-%m-%d')

last_series= nil
race_index = 1
race_date  = first_day

Weeks.delete_all

CSV.foreach(input_file, headers:true) do |row|
  series_name=row["series"]
  if last_series == series_name
    race_index += 1
    race_date  += 7
  else
    race_index = 1
    race_date  = first_day
  end
  last_series = series_name
  
  series=Series.where(name:series_name).first
  Weeks.create(:series_id => series.id, :index => race_index,
               :track_name => "#{row["track_name"]} (#{row["sim_time"]}, #{row["duration"]})",
               :start => race_date)

end


