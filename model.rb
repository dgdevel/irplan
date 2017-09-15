require 'active_record'

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
end

class Plans < ActiveRecord::Base; end
