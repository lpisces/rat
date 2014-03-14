require 'test_helper'

class Cpanel::SettingsControllerTest < ActionController::TestCase
  setup do
    @cpanel_setting = cpanel_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cpanel_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cpanel_setting" do
    assert_difference('Cpanel::Setting.count') do
      post :create, cpanel_setting: { key: @cpanel_setting.key, value: @cpanel_setting.value }
    end

    assert_redirected_to cpanel_setting_path(assigns(:cpanel_setting))
  end

  test "should show cpanel_setting" do
    get :show, id: @cpanel_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cpanel_setting
    assert_response :success
  end

  test "should update cpanel_setting" do
    patch :update, id: @cpanel_setting, cpanel_setting: { key: @cpanel_setting.key, value: @cpanel_setting.value }
    assert_redirected_to cpanel_setting_path(assigns(:cpanel_setting))
  end

  test "should destroy cpanel_setting" do
    assert_difference('Cpanel::Setting.count', -1) do
      delete :destroy, id: @cpanel_setting
    end

    assert_redirected_to cpanel_settings_path
  end
end
