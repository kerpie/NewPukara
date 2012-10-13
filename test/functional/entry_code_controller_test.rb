require 'test_helper'

class EntryCodeControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
