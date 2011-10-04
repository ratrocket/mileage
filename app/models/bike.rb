class Bike < ActiveRecord::Base
  has_many :rides
  has_many :notes
  belongs_to :user

  before_save :slugify

  private

  def slugify
    self.slug = Util.slugify self.name
  end
end
