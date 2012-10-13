require 'test_helper'

class SellPriceControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get save_price" do
    get :save_price
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
