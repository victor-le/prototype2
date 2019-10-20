require "application_system_test_case"

class AppDurationsTest < ApplicationSystemTestCase
  setup do
    @app_duration = app_durations(:one)
  end

  test "visiting the index" do
    visit app_durations_url
    assert_selector "h1", text: "App Durations"
  end

  test "creating a App duration" do
    visit app_durations_url
    click_on "New App Duration"

    fill_in "Duration", with: @app_duration.duration
    fill_in "Durationprice", with: @app_duration.durationPrice
    click_on "Create App duration"

    assert_text "App duration was successfully created"
    click_on "Back"
  end

  test "updating a App duration" do
    visit app_durations_url
    click_on "Edit", match: :first

    fill_in "Duration", with: @app_duration.duration
    fill_in "Durationprice", with: @app_duration.durationPrice
    click_on "Update App duration"

    assert_text "App duration was successfully updated"
    click_on "Back"
  end

  test "destroying a App duration" do
    visit app_durations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "App duration was successfully destroyed"
  end
end
