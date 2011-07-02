class AddUserIdToRideAndBike < ActiveRecord::Migration
  def self.up
    add_column :rides, :user_id, :integer
    add_column :bikes, :user_id, :integer

    Bike.reset_column_information
    Ride.reset_column_information

    user = User.find_by_username('ratrocket')

    Bike.all.each do |bike|
      bike.user = user
      bike.save
    end

    Ride.all.each do |ride|
      ride.user = user
      ride.save
    end
  end

  def self.down
    remove_column :rides, :user_id
    remove_column :bikes, :user_id
  end
end
