require 'test_helper'

class OutputFoldersControllerTest < ActionController::TestCase
  setup do
    @output_folder = output_folders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:output_folders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create output_folder" do
    assert_difference('OutputFolder.count') do
      post :create, output_folder: { client_id: @output_folder.client_id, date: @output_folder.date, folder_state_id: @output_folder.folder_state_id, user_id: @output_folder.user_id }
    end

    assert_redirected_to output_folder_path(assigns(:output_folder))
  end

  test "should show output_folder" do
    get :show, id: @output_folder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @output_folder
    assert_response :success
  end

  test "should update output_folder" do
    put :update, id: @output_folder, output_folder: { client_id: @output_folder.client_id, date: @output_folder.date, folder_state_id: @output_folder.folder_state_id, user_id: @output_folder.user_id }
    assert_redirected_to output_folder_path(assigns(:output_folder))
  end

  test "should destroy output_folder" do
    assert_difference('OutputFolder.count', -1) do
      delete :destroy, id: @output_folder
    end

    assert_redirected_to output_folders_path
  end
end
