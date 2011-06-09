class Ride < ActiveRecord::Base
  belongs_to :bike
  has_many :notes
end
