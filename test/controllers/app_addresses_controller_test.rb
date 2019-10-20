require 'test_helper'

class AppAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_address = app_addresses(:one)
  end

  test "should get index" do
    get app_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_app_address_url
    assert_response :success
  end

  test "should create app_address" do
    assert_difference('AppAddress.count') do
      post app_addresses_url, params: { app_address: { city: @app_address.city, homeAddress: @app_address.homeAddress, homeType: @app_address.homeType, state: @app_address.state, suiteNumber: @app_address.suiteNumber, zipcode: @app_address.zipcode } }
    end

    assert_redirected_to app_address_url(AppAddress.last)
  end

  test "should show app_address" do
    get app_address_url(@app_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_address_url(@app_address)
    assert_response :success
  end

  test "should update app_address" do
    patch app_address_url(@app_address), params: { app_address: { city: @app_address.city, homeAddress: @app_address.homeAddress, homeType: @app_address.homeType, state: @app_address.state, suiteNumber: @app_address.suiteNumber, zipcode: @app_address.zipcode } }
    assert_redirected_to app_address_url(@app_address)
  end

  test "should destroy app_address" do
    assert_difference('AppAddress.count', -1) do
      delete app_address_url(@app_address)
    end

    assert_redirected_to app_addresses_url
  end
end
