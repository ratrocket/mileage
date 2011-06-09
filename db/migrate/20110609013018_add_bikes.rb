class AddBikes < ActiveRecord::Migration
  def self.up
    add_column(:bikes, :wheelbuilder, :string)
    add_column(:bikes, :slug, :string)
    add_column(:bikes, :misc, :string)
    remove_column(:bikes, :notes)

    Bike.reset_column_information

    notes = "Fork is 'mid-trail' in the sense that it's the middle trail offering that Kogswell had.  It's a low trail fork.  I have a photograph of the steerer tube with the offset inscribed on it.  I think it puts the trail around 40mm."

    kogswell = {
      :name => "Kogswell P/R",
      :frame => "Kogswell P/R, G3",
      :fork => "Kogswell P/R, mid-trail",
      :handlebars => "Grand Bois Randonneur (AVA Randonneur bend)",
      :stem => "VO Threadless, 26.0 (shimmed to 25.4), -6 deg, 80mm(?)",
      :headset => "Cane Creek (check model)",
      :saddle => "Brooks B17 Standard, 'Brooks England' badged",
      :seat_post => "Nitto Crystal Fellow",
      :brakes => "Shimano BR MC 70",
      :brake_pads => "Kool Stop salmon",
      :brake_levers => "Suntour Superbe (Chris Kostman's)",
      :brake_cables => "from ABR",
      :crank => "TA Pro 5 Vis, 170mm",
      :chainrings => "TA 46/28",
      :pedals => "Wellgo MG-1, champagne",
      :bottom_bracket => "from ABR (Shimano? IRD?)",
      :chain => "Connex",
      :front_derailer => "Shimano Deore XT (old one)",
      :rear_derailer => "Shimano Deore long cage",
      :derailer_cables => "from ABR",
      :shift_levers => "Suntour Sprint (with microratchets)",
      :front_hub => "Shimano dynohub (check model)",
      :rear_hub => "Shimano Deore cassette (recent)",
      :rims => "Velocity Dyad 650b",
      :spokes => "came with wheels",
      :freewheel_cassette => "Shimano/Harris Century Special 13-30 cassette",
      :tires => "Mitsuboshi Trimline",
      :tubes => "Schwalbe",
      :fenders => "VO Zeppelin, modified for 2 bolt stay attachment",
      :racks => "Nitto M-12 front",
      :front_lights => "B&M IQ Cyo (nearfield, standlight; check model)",
      :rear_lights => "B&M Seculite Plus and PDW Radbot 1000",
      :bottle_cages => "King steel",
      :luggage => "Acorn Boxy Rando bag",
      :notes => notes,
      :version => 1,
      :wheelbuilder => "Handspun (QBP wheel manufacturer?)",
      :slug => slugify("Kogswell P/R"),
      :misc => "Seat collar: Surly steel (from Aaron)"
    }

  end

  def self.down
  end
end
