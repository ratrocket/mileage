class Ride < ActiveRecord::Base
  belongs_to :bike
  has_many :notes

  before_save :convert_units

  def summary
    [date.to_s, "#{miles} miles", "#{kilometers} km", bike.name, description].
      join("\n")
  end

  private

  # TODO have to make sure only one or the other is present (in create()
  # or new())
  def convert_units
    # 1 mile = 1.6093 km
    # 1 km   = 0.6214 miles
    if self.kilometers.present?
      self.miles = self.kilometers / 1.6093
    elsif self.miles.present?
      self.kilometers = self.miles * 1.6093
    end
  end
end
