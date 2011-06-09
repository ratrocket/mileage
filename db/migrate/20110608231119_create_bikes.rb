class CreateBikes < ActiveRecord::Migration
  def self.up
    create_table :bikes do |t|
      t.string :name
      t.string :slug
      t.string :frame
      t.string :fork
      t.string :handlebars
      t.string :stem
      t.string :headset
      t.string :saddle
      t.string :seat_post
      t.string :brakes
      t.string :brake_pads
      t.string :brake_levers
      t.string :brake_cables
      t.string :crank
      t.string :chainrings
      t.string :pedals
      t.string :bottom_bracket
      t.string :chain
      t.string :front_derailer
      t.string :rear_derailer
      t.string :derailer_cables
      t.string :shift_levers
      t.string :front_hub
      t.string :rear_hub
      t.string :rims
      t.string :spokes
      t.string :freewheel_cassette
      t.string :tires
      t.string :tubes
      t.string :fenders
      t.string :racks
      t.string :front_lights
      t.string :rear_lights
      t.string :bottle_cages
      t.string :luggage
      t.string :wheelbuilder
      t.string :misc
      t.integer :version

      t.timestamps
    end
  end

  def self.down
    drop_table :bikes
  end
end
