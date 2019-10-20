require "application_system_test_case"

class AppSchedulesTest < ApplicationSystemTestCase
  setup do
    @app_schedule = app_schedules(:one)
  end

  test "visiting the index" do
    visit app_schedules_url
    assert_selector "h1", text: "App Schedules"
  end

  test "creating a App schedule" do
    visit app_schedules_url
    click_on "New App Schedule"

    fill_in "Appduration", with: @app_schedule.appduration_id
    fill_in "City", with: @app_schedule.city
    fill_in "Homeaddress", with: @app_schedule.homeAddress
    fill_in "Hometype", with: @app_schedule.homeType
    fill_in "Service", with: @app_schedule.service_id
    fill_in "Specialrequirement", with: @app_schedule.specialrequirement_id
    fill_in "State", with: @app_schedule.state
    fill_in "Suitenumber", with: @app_schedule.suiteNumber
    fill_in "User", with: @app_schedule.user_id
    fill_in "Zipcode", with: @app_schedule.zipcode
    click_on "Create App schedule"

    assert_text "App schedule was successfully created"
    click_on "Back"
  end

  test "updating a App schedule" do
    visit app_schedules_url
    click_on "Edit", match: :first

    fill_in "Appduration", with: @app_schedule.appduration_id
    fill_in "City", with: @app_schedule.city
    fill_in "Homeaddress", with: @app_schedule.homeAddress
    fill_in "Hometype", with: @app_schedule.homeType
    fill_in "Service", with: @app_schedule.service_id
    fill_in "Specialrequirement", with: @app_schedule.specialrequirement_id
    fill_in "State", with: @app_schedule.state
    fill_in "Suitenumber", with: @app_schedule.suiteNumber
    fill_in "User", with: @app_schedule.user_id
    fill_in "Zipcode", with: @app_schedule.zipcode
    click_on "Update App schedule"

    assert_text "App schedule was successfully updated"
    click_on "Back"
  end

  test "destroying a App schedule" do
    visit app_schedules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "App schedule was successfully destroyed"
  end
end
