require 'test_helper'

class StockControllerTest < ActionController::TestCase
  test "should get check_stock" do
    get :check_stock
    assert_response :success
  end

  test "should get add_stock" do
    get :add_stock
    assert_response :success
  end

  test "should get remove_stock" do
    get :remove_stock
    assert_response :success
  end

end
