class Bike < ActiveRecord::Base
  has_many :rides
  has_many :notes
end
