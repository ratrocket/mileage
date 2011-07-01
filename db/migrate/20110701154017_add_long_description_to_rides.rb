class AddLongDescriptionToRides < ActiveRecord::Migration
  def self.up
    change_column :rides, :description, :string
    add_column :rides, :long_description, :text
  end

  def self.down
    change_column :rides, :description, :text
    remove_column :rides, :long_description
  end
end
