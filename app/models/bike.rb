class Bike < ActiveRecord::Base
  has_many :rides
  has_many :notes
  belongs_to :user
end
