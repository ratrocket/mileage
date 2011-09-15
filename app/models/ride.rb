class Ride < ActiveRecord::Base
  belongs_to :bike
  has_many :notes
  belongs_to :user

  scope :templates, where(:template => true)
  # can't do this OR with a where() it seems...
  scope :reals, :conditions => ['template is null or template = false']

  # my week goes from Sunday to Saturday...
  scope :weekly, lambda {|*args|
    d = self.str2date(args.first) || Date.today
    where(:date => d.monday.yesterday..d.sunday.yesterday)
  }
  scope :monthly, lambda {|*args|
    d = self.str2date(args.first) || Date.today
    where(:date => d.beginning_of_month..d.end_of_month)
  }
  scope :yearly, lambda {|*args|
    d = self.str2date(args.first) || Date.today
    where(:date => d.beginning_of_year..d.end_of_year)
  }

  before_save :convert_units

  # TODO poorly named?
  def summary
    [date.to_s, "#{miles} miles", "#{kilometers} km", bike.name, description].
      join("\n")
  end

  private

  # TODO:   this shouldn't be in Ride
  # TODO 2: if year is omitted, assume current year
  # TODO 3: there's not much error handling here
  def self.str2date(str)
    return str if str.kind_of? Date
    if str =~ /\//
      sep = '/'
    elsif str =~ /-/
      sep = '-'
    else
      return nil  # punt
    end

    m, d, y = str.split(sep).map(&:to_i)
    y = y + 2000 if y < 100
    date = Date.new(y, m, d)
  end

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
