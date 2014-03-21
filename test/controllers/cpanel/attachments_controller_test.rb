require 'test_helper'

class Cpanel::AttachmentsControllerTest < ActionController::TestCase
  setup do
    @cpanel_attachment = cpanel_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cpanel_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cpanel_attachment" do
    assert_difference('Cpanel::Attachment.count') do
      post :create, cpanel_attachment: { file: @cpanel_attachment.file, name: @cpanel_attachment.name }
    end

    assert_redirected_to cpanel_attachment_path(assigns(:cpanel_attachment))
  end

  test "should show cpanel_attachment" do
    get :show, id: @cpanel_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cpanel_attachment
    assert_response :success
  end

  test "should update cpanel_attachment" do
    patch :update, id: @cpanel_attachment, cpanel_attachment: { file: @cpanel_attachment.file, name: @cpanel_attachment.name }
    assert_redirected_to cpanel_attachment_path(assigns(:cpanel_attachment))
  end

  test "should destroy cpanel_attachment" do
    assert_difference('Cpanel::Attachment.count', -1) do
      delete :destroy, id: @cpanel_attachment
    end

    assert_redirected_to cpanel_attachments_path
  end
end
