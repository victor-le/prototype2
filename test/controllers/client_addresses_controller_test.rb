require 'test_helper'

class ClientAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_address = client_addresses(:one)
  end

  test "should get index" do
    get client_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_client_address_url
    assert_response :success
  end

  test "should create client_address" do
    assert_difference('ClientAddress.count') do
      post client_addresses_url, params: { client_address: { appaddress_id: @client_address.appaddress_id, client_id: @client_address.client_id, comments: @client_address.comments } }
    end

    assert_redirected_to client_address_url(ClientAddress.last)
  end

  test "should show client_address" do
    get client_address_url(@client_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_address_url(@client_address)
    assert_response :success
  end

  test "should update client_address" do
    patch client_address_url(@client_address), params: { client_address: { appaddress_id: @client_address.appaddress_id, client_id: @client_address.client_id, comments: @client_address.comments } }
    assert_redirected_to client_address_url(@client_address)
  end

  test "should destroy client_address" do
    assert_difference('ClientAddress.count', -1) do
      delete client_address_url(@client_address)
    end

    assert_redirected_to client_addresses_url
  end
end
