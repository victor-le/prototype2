require 'test_helper'

class AppDurationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_duration = app_durations(:one)
  end

  test "should get index" do
    get app_durations_url
    assert_response :success
  end

  test "should get new" do
    get new_app_duration_url
    assert_response :success
  end

  test "should create app_duration" do
    assert_difference('AppDuration.count') do
      post app_durations_url, params: { app_duration: { duration: @app_duration.duration, durationPrice: @app_duration.durationPrice } }
    end

    assert_redirected_to app_duration_url(AppDuration.last)
  end

  test "should show app_duration" do
    get app_duration_url(@app_duration)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_duration_url(@app_duration)
    assert_response :success
  end

  test "should update app_duration" do
    patch app_duration_url(@app_duration), params: { app_duration: { duration: @app_duration.duration, durationPrice: @app_duration.durationPrice } }
    assert_redirected_to app_duration_url(@app_duration)
  end

  test "should destroy app_duration" do
    assert_difference('AppDuration.count', -1) do
      delete app_duration_url(@app_duration)
    end

    assert_redirected_to app_durations_url
  end
end
