require 'active_record'
require 'cgi'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => 'data.db'
)

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'series'
    create_table :series do |table|
      table.column :name, :string
      table.column :offset, :integer
      table.column :step, :integer
      table.column :official, :integer
    end
  end
  unless ActiveRecord::Base.connection.column_exists? 'series', 'results'
    change_table :series do |table|
      table.column :results, :string
    end
  end
end

class Series < ActiveRecord::Base

  def race_times
    Array((offset..1440).step(step))
  end

end

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'car_classes'
    create_table :car_classes do |table|
      table.column :series_id, :integer
      table.column :name, :string
      table.column :shortname, :string
    end
  end
end

class CarClasses < ActiveRecord::Base; end

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'weeks'
    create_table :weeks do |table|
      table.column :series_id, :integer
      table.column :index, :integer
      table.column :track_name, :string
      table.column :start, :date
    end
  end
end

class Weeks < ActiveRecord::Base

  def race_days
    Array(0..6).map { |offset| self.start + offset }
  end

end

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'plans'
    create_table :plans do |table|
      table.column :series_id, :integer
      table.column :weeks_id, :integer
      table.column :driver_name, :string
      table.column :probability, :integer
      table.column :race, :integer
    end
  end
  unless ActiveRecord::Base.connection.column_exists? 'plans', 'car_classes_id'
    change_table :plans do |table|
      table.column :car_classes_id, :integer
    end
  end
end

class Plans < ActiveRecord::Base

  def htmlname(car_classes)
    out = if self.car_classes_id > 0
      car_classes.select { |cc| cc.id == self.car_classes_id }.first.shortname +
        ':&nbsp;' + self.driver_name
    else
      self.driver_name
    end
    CGI.escapeHTML(out).sub(" ", "&nbsp;")
  end

end

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'events'
    create_table :events do |table|
      table.column :name, :string
    end
  end
end

class Events < ActiveRecord::Base; end

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'event_races'
    create_table :event_races do |table|
      table.column :events_id, :integer
      table.column :track_name, :string
      table.column :index, :integer
      table.column :start, :datetime
    end
  end
end

class EventRaces < ActiveRecord::Base; end

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'event_plans'
    create_table :event_plans do |table|
      table.column :events_id, :integer
      table.column :events_races_id, :integer
      table.column :driver_name, :string
      table.column :probability, :integer
    end
  end
end

class EventPlans < ActiveRecord::Base; end

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'highlighted_weeklies'
    create_table :highlighted_weeklies do |table|
      table.column :series_id, :integer
      table.column :color, :string
      table.column :name, :string
      table.column :index, :integer
    end
  end
end

class HighlightedWeekly < ActiveRecord::Base; end



