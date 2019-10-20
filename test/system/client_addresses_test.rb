require "application_system_test_case"

class ClientAddressesTest < ApplicationSystemTestCase
  setup do
    @client_address = client_addresses(:one)
  end

  test "visiting the index" do
    visit client_addresses_url
    assert_selector "h1", text: "Client Addresses"
  end

  test "creating a Client address" do
    visit client_addresses_url
    click_on "New Client Address"

    fill_in "Appaddress", with: @client_address.appaddress_id
    fill_in "Client", with: @client_address.client_id
    fill_in "Comments", with: @client_address.comments
    click_on "Create Client address"

    assert_text "Client address was successfully created"
    click_on "Back"
  end

  test "updating a Client address" do
    visit client_addresses_url
    click_on "Edit", match: :first

    fill_in "Appaddress", with: @client_address.appaddress_id
    fill_in "Client", with: @client_address.client_id
    fill_in "Comments", with: @client_address.comments
    click_on "Update Client address"

    assert_text "Client address was successfully updated"
    click_on "Back"
  end

  test "destroying a Client address" do
    visit client_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Client address was successfully destroyed"
  end
end
