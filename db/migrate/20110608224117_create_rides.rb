class CreateRides < ActiveRecord::Migration
  def self.up
    create_table :rides do |t|
      t.float :miles
      t.float :kilometers
      t.text :description
      t.integer :bike_id
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :rides
  end
end
