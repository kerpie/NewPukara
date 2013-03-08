require 'test_helper'

class QuotationsControllerTest < ActionController::TestCase
  setup do
    @quotation = quotations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quotations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quotation" do
    assert_difference('Quotation.count') do
      post :create, quotation: { client_id: @quotation.client_id, code: @quotation.code, date: @quotation.date, money_expected: @quotation.money_expected, money_received: @quotation.money_received, money_returned: @quotation.money_returned, money_type_id: @quotation.money_type_id, user_id: @quotation.user_id }
    end

    assert_redirected_to quotation_path(assigns(:quotation))
  end

  test "should show quotation" do
    get :show, id: @quotation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quotation
    assert_response :success
  end

  test "should update quotation" do
    put :update, id: @quotation, quotation: { client_id: @quotation.client_id, code: @quotation.code, date: @quotation.date, money_expected: @quotation.money_expected, money_received: @quotation.money_received, money_returned: @quotation.money_returned, money_type_id: @quotation.money_type_id, user_id: @quotation.user_id }
    assert_redirected_to quotation_path(assigns(:quotation))
  end

  test "should destroy quotation" do
    assert_difference('Quotation.count', -1) do
      delete :destroy, id: @quotation
    end

    assert_redirected_to quotations_path
  end
end
