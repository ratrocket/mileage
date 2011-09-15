class RidesController < ApplicationController
  before_filter :login_required, :set_user

  def index
    @rides = @user.rides.reals.sort_by(&:date)
  end

  def show
    @ride = @user.rides.find(params[:id])
  end

  def new
    @ride = Ride.new
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

  private
  def set_user
    @user ||= current_user  # dunno about the ||= ...
  end
end
