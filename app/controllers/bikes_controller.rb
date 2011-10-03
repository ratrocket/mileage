class BikesController < ApplicationController
  before_filter :login_required, :set_user

  def index
    @bikes = @user.bikes
  end

  def show
    @bike = @user.bikes.find(params[:id])
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(params[:bike])
    if @bike.save
      redirect_to @bike, :notice => "Successfully created bike."
    else
      render :action => 'new'
    end
  end

  def edit
    @bike = @user.bikes.find(params[:id])
  end

  def update
    @bike = @user.bikes.find(params[:id])
    if @bike.update_attributes(params[:bike])
      redirect_to @bike, :notice  => "Successfully updated bike."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @bike = @user.bikes.find(params[:id])
    @bike.destroy
    redirect_to bikes_url, :notice => "Successfully destroyed bike."
  end
end
