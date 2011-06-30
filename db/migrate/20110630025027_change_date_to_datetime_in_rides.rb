class ChangeDateToDatetimeInRides < ActiveRecord::Migration
  def self.up
    change_column :rides, :date, :datetime
  end

  def self.down
    change_column :rides, :date, :date
  end
end
