require 'test_helper'

class AppSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_schedule = app_schedules(:one)
  end

  test "should get index" do
    get app_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_app_schedule_url
    assert_response :success
  end

  test "should create app_schedule" do
    assert_difference('AppSchedule.count') do
      post app_schedules_url, params: { app_schedule: { appduration_id: @app_schedule.appduration_id, city: @app_schedule.city, homeAddress: @app_schedule.homeAddress, homeType: @app_schedule.homeType, service_id: @app_schedule.service_id, specialrequirement_id: @app_schedule.specialrequirement_id, state: @app_schedule.state, suiteNumber: @app_schedule.suiteNumber, user_id: @app_schedule.user_id, zipcode: @app_schedule.zipcode } }
    end

    assert_redirected_to app_schedule_url(AppSchedule.last)
  end

  test "should show app_schedule" do
    get app_schedule_url(@app_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_schedule_url(@app_schedule)
    assert_response :success
  end

  test "should update app_schedule" do
    patch app_schedule_url(@app_schedule), params: { app_schedule: { appduration_id: @app_schedule.appduration_id, city: @app_schedule.city, homeAddress: @app_schedule.homeAddress, homeType: @app_schedule.homeType, service_id: @app_schedule.service_id, specialrequirement_id: @app_schedule.specialrequirement_id, state: @app_schedule.state, suiteNumber: @app_schedule.suiteNumber, user_id: @app_schedule.user_id, zipcode: @app_schedule.zipcode } }
    assert_redirected_to app_schedule_url(@app_schedule)
  end

  test "should destroy app_schedule" do
    assert_difference('AppSchedule.count', -1) do
      delete app_schedule_url(@app_schedule)
    end

    assert_redirected_to app_schedules_url
  end
end
