require 'test_helper'

class AppTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_time = app_times(:one)
  end

  test "should get index" do
    get app_times_url
    assert_response :success
  end

  test "should get new" do
    get new_app_time_url
    assert_response :success
  end

  test "should create app_time" do
    assert_difference('AppTime.count') do
      post app_times_url, params: { app_time: { appDate: @app_time.appDate } }
    end

    assert_redirected_to app_time_url(AppTime.last)
  end

  test "should show app_time" do
    get app_time_url(@app_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_time_url(@app_time)
    assert_response :success
  end

  test "should update app_time" do
    patch app_time_url(@app_time), params: { app_time: { appDate: @app_time.appDate } }
    assert_redirected_to app_time_url(@app_time)
  end

  test "should destroy app_time" do
    assert_difference('AppTime.count', -1) do
      delete app_time_url(@app_time)
    end

    assert_redirected_to app_times_url
  end
end
