require "application_system_test_case"

class AppTimesTest < ApplicationSystemTestCase
  setup do
    @app_time = app_times(:one)
  end

  test "visiting the index" do
    visit app_times_url
    assert_selector "h1", text: "App Times"
  end

  test "creating a App time" do
    visit app_times_url
    click_on "New App Time"

    fill_in "Appdate", with: @app_time.appDate
    click_on "Create App time"

    assert_text "App time was successfully created"
    click_on "Back"
  end

  test "updating a App time" do
    visit app_times_url
    click_on "Edit", match: :first

    fill_in "Appdate", with: @app_time.appDate
    click_on "Update App time"

    assert_text "App time was successfully updated"
    click_on "Back"
  end

  test "destroying a App time" do
    visit app_times_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "App time was successfully destroyed"
  end
end
