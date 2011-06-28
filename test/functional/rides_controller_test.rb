require 'test_helper'

class RidesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Ride.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Ride.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Ride.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to ride_url(assigns(:ride))
  end

  def test_edit
    get :edit, :id => Ride.first
    assert_template 'edit'
  end

  def test_update_invalid
    Ride.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Ride.first
    assert_template 'edit'
  end

  def test_update_valid
    Ride.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Ride.first
    assert_redirected_to ride_url(assigns(:ride))
  end

  def test_destroy
    ride = Ride.first
    delete :destroy, :id => ride
    assert_redirected_to rides_url
    assert !Ride.exists?(ride.id)
  end
end
