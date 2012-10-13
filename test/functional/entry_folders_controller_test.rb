require 'test_helper'

class EntryFoldersControllerTest < ActionController::TestCase
  setup do
    @entry_folder = entry_folders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entry_folders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entry_folder" do
    assert_difference('EntryFolder.count') do
      post :create, entry_folder: { date: @entry_folder.date, folder_state_id: @entry_folder.folder_state_id, supplier_id: @entry_folder.supplier_id, user_id: @entry_folder.user_id }
    end

    assert_redirected_to entry_folder_path(assigns(:entry_folder))
  end

  test "should show entry_folder" do
    get :show, id: @entry_folder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entry_folder
    assert_response :success
  end

  test "should update entry_folder" do
    put :update, id: @entry_folder, entry_folder: { date: @entry_folder.date, folder_state_id: @entry_folder.folder_state_id, supplier_id: @entry_folder.supplier_id, user_id: @entry_folder.user_id }
    assert_redirected_to entry_folder_path(assigns(:entry_folder))
  end

  test "should destroy entry_folder" do
    assert_difference('EntryFolder.count', -1) do
      delete :destroy, id: @entry_folder
    end

    assert_redirected_to entry_folders_path
  end
end
