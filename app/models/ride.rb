class Ride < ActiveRecord::Base
  belongs_to :bike
  has_many :notes

  # my week goes from Sunday to Saturday...
  named_scope :weekly, lambda {|*args|
    d = args.first || Date.today
    {:conditions => {:date => d.monday.yesterday..d.sunday.yesterday}}
  }
  named_scope :monthly, lambda {|*args|
    d = args.first || Date.today
    {:conditions => {:date => d.beginning_of_month..d.end_of_month}}
  }
  named_scope :yearly, lambda {|*args|
    d = args.first || Date.today
    {:conditions => {:date => d.beginning_of_year..d.end_of_year}}
  }

  before_save :convert_units

  # TODO poorly named?  The following class methods are all "summary"
  # methods in nature, after all.
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
