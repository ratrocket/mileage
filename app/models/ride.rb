class Ride < ActiveRecord::Base
  belongs_to :bike
  has_many :notes
  belongs_to :user

  # can't do an OR with a where()?
  scope :reals, :conditions => ['template is null or template = false']
  scope :templates, where(:template => true)

  ##
  # When scopes
  #
  scope :week, lambda {|*args|  # my week goes from Sunday to Saturday...
    d = self.str2date(args.first) || Date.today
    where(:date => d.monday.yesterday..d.sunday.yesterday)
  }

  # nil values mean to skip everything; zero means set default
  # "skip everything" only if both are nil though
  scope :month_and_year, lambda {|m,y|  # or just year
    unless m.nil? && y.nil?
      if m.nil? || m.zero?
        d = self.str2date("1/1/#{y}")
        where(:date => d.beginning_of_year..d.end_of_year)
      else
        y = Date.today.year if (y.nil? || y.zero?)
        d = self.str2date("#{m}/1/#{y}")
        where(:date => d.beginning_of_month..d.end_of_month)
      end
    end
  }

  ##
  # What scopes
  #
  scope :bike, lambda {|b|
    where(:bike_id => Bike.find_by_slug(b)) unless b.blank?
  }
  scope :service, :conditions => ["description like ?", "SERVICE%"]

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
