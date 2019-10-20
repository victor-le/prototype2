require "application_system_test_case"

class AppAddressesTest < ApplicationSystemTestCase
  setup do
    @app_address = app_addresses(:one)
  end

  test "visiting the index" do
    visit app_addresses_url
    assert_selector "h1", text: "App Addresses"
  end

  test "creating a App address" do
    visit app_addresses_url
    click_on "New App Address"

    fill_in "City", with: @app_address.city
    fill_in "Homeaddress", with: @app_address.homeAddress
    fill_in "Hometype", with: @app_address.homeType
    fill_in "State", with: @app_address.state
    fill_in "Suitenumber", with: @app_address.suiteNumber
    fill_in "Zipcode", with: @app_address.zipcode
    click_on "Create App address"

    assert_text "App address was successfully created"
    click_on "Back"
  end

  test "updating a App address" do
    visit app_addresses_url
    click_on "Edit", match: :first

    fill_in "City", with: @app_address.city
    fill_in "Homeaddress", with: @app_address.homeAddress
    fill_in "Hometype", with: @app_address.homeType
    fill_in "State", with: @app_address.state
    fill_in "Suitenumber", with: @app_address.suiteNumber
    fill_in "Zipcode", with: @app_address.zipcode
    click_on "Update App address"

    assert_text "App address was successfully updated"
    click_on "Back"
  end

  test "destroying a App address" do
    visit app_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "App address was successfully destroyed"
  end
end
