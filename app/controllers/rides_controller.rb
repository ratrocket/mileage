class RidesController < ApplicationController
  before_filter :login_required, :set_user

  def index
    if params[:filter] && params[:filter].values.map(&:empty?).uniq.include?(false)

      f = Class.new do; attr_accessor :bike, :year, :month; end
      @filter = f.new

      year = @filter.year = params[:filter][:year].to_i
      month = @filter.month = params[:filter][:month].to_i
      bike = @filter.bike = params[:filter][:bike]

      @rides = @user.rides.reals.bike(bike).month_and_year(month, year).sort_by(&:date)
    else
      @rides = @user.rides.reals.sort_by(&:date)
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
