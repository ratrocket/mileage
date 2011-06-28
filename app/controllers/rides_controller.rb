class RidesController < ApplicationController
  def index
    @rides = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def new
    @ride = Ride.new
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
    @ride = Ride.find(params[:id])
  end

  def update
    @ride = Ride.find(params[:id])
    if @ride.update_attributes(params[:ride])
      redirect_to @ride, :notice  => "Successfully updated ride."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ride = Ride.find(params[:id])
    @ride.destroy
    redirect_to rides_url, :notice => "Successfully destroyed ride."
  end
end
