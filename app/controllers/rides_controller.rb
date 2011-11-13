class RidesController < ApplicationController
  before_filter :login_required, :set_user

  def index
    f = Class.new do; attr_accessor :bike, :year, :month; end
    @filter = f.new

    year, month, bike =
      if params[:filter] && params[:filter].values.map(&:empty?).uniq.include?(false)
        [@filter.year = params[:filter][:year].to_i,
         @filter.month = params[:filter][:month].to_i,
         @filter.bike = params[:filter][:bike]]
      else
        Array.new(3)  # [nil, nil, nil]
      end

    # TODO: setting a default year is taken care of in the scope in the
    # model, but maybe it's better to do it here and make the model
    # dumber?  NMW, for now I have to set a default year here TOO, which
    # isn't great...
    if !month.nil? && month > 0 && (year.nil? || year.zero?)
      year = Date.today.year
    end

    @rides = @user.rides.reals.bike(bike).month_and_year(month, year).sort_by(&:date)
    @services = @user.rides.reals.service.bike(bike).month_and_year(month, year).sort_by(&:date)
    @rides_only = @rides - @services

    # these could perhaps be simpler?
    @rides_by_bike = @rides_only.map(&:bike).uniq.map {|b| [b.name, @rides_only.select {|r| r.bike_id == b.id}.size, @rides_only.select {|r| r.bike_id == b.id}.map(&:miles).sum]}
    @services_by_bike = @services.map(&:bike).uniq.map {|b| [b.name, @services.select {|r| r.bike_id == b.id}.size]}

    # count # of days/month that were ridden
    @days_ridden, @total_days =
      if year && month
        days = if (year == Date.today.year && month == Date.today.month)
                 Date.today.day
               else
                 Date.civil(year, month, -1).day
               end
        [@rides_only.map(&:date).uniq.size, days]
      else
        [nil, nil]
      end
  end

  def show
    @ride = @user.rides.find(params[:id])
  end

  def new
    unless request.post?
      @ride = Ride.new
    else
      @ride = Ride.find(params[:template]).dup
      @ride.template = nil
      @ride.date = Date.today
    end
    @templates = @user.rides.templates
  end

  def create
    @ride = Ride.new(params[:ride])
    if @ride.save
      redirect_to @ride, :notice => "Successfully created ride."
    else
      render :action => 'new'
    end
  end

  def edit
    @ride = @user.rides.find(params[:id])
  end

  def update
    @ride = @user.rides.find(params[:id])
    if @ride.update_attributes(params[:ride])
      redirect_to @ride, :notice  => "Successfully updated ride."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ride = @user.rides.find(params[:id])
    @ride.destroy
    redirect_to rides_url, :notice => "Successfully destroyed ride."
  end
end
