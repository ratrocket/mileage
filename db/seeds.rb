# This file should contain all the record creation needed to seed the
# database with its default values.
#
# The data can then be loaded with the rake db:seed (or created
# alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

kogswell = {
  :name => "Kogswell P/R",
  :nickname => "kogswell",
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
  :chainrings => "TA 44/28",
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
  :version => 1,
  :wheelbuilder => "Handspun (QBP wheel manufacturer?)",
  :slug => Util.slugify("Kogswell P/R"),
}

rambouillet = {
  :name => "Rambouillet",
  :nickname => "rambouillet",
  :frame => "Rivendell Rambouillet, orange",
  :fork => "Rivendell Rambouillet",
  :handlebars => "Nitto Noodle, 42cm",
  :stem => "Nitto lugged, 11cm",
  :headset => "Tange (?)",
  :saddle => "Brooks B17 Special",
  :seat_post => "American Classic",
  :brakes => "Mafac Racer (modified by shop after they broke)",
  :brake_pads => "Kool Stop black",
  :brake_levers => "Suntour Superbe Pro",
  :brake_cables => "from ABR",
  :crank => "TA Pro 5 Vis, 170mm",
  :chainrings => "TA 42/26",
  :pedals => "Black Ops platforms",
  :bottom_bracket => "from ABR (Shimano? IRD?; Italian threaded)",
  :chain => "SRAM 8 speed",
  :front_derailer => "Campagnolo Centaur (from Rivendell)",
  :rear_derailer => "Suntour XC Pro (needs to be replaced)",
  :derailer_cables => "from ABR",
  :shift_levers => "Silver",
  :front_hub => "hi flange used bin find from ABR",
  :rear_hub => "similar to front hub. Freewheel hub",
  :rims => "Torelli Master",
  :spokes => "from ABR",
  :freewheel_cassette => "IRD (check range)",
  :tires => "Grand Bois Cypres (31mm)",
  :tubes => "no name",
  :fenders => "Honjo fluted",
  :racks => "none",
  :front_lights => "battery powered",
  :rear_lights => "long vertical Cateye (battery)",
  :bottle_cages => "King steel",
  :luggage => "Acorn saddlebag",
  :version => 1,
  :wheelbuilder => "Aaron (from Surly Crosscheck originally)",
  :slug => Util.slugify("Rambouillet"),
}

Bike.create(kogswell)
Bike.create(rambouillet)

k = Bike.find_by_slug('kogswell_pr')
r = Bike.find_by_slug('rambouillet')

Note.create(:note => "Seat collar: Surly steel (from Aaron)", :bike_id => k.id)

Note.create(:note => "Fork is 'mid-trail' in the sense that it's the middle trail offering that Kogswell had.  It's a low trail fork.  I have a photograph of the steerer tube with the offset inscribed on it.  I think it puts the trail around 40mm.", :bike_id => k.id)

Note.create(
  :note => "Supposedly this is from an early batch of Rambouillets where the bottom brackets were somehow messed up and had to be reamed out to Italian threading.  That's why it needs an Italian threaded BB.", :bike_id => r.id)

Note.create(:note => "The front wheel is laced in a distinctive crow's foot pattern", :bike_id => r.id)
