class AddTemplateToRides < ActiveRecord::Migration
  def self.up
    add_column :rides, :template, :boolean
  end

  def self.down
    remove_column :rides, :template
  end
end
