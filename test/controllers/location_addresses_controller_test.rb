require 'test_helper'

class LocationAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_address = location_addresses(:one)
  end

  test "should get index" do
    get location_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_location_address_url
    assert_response :success
  end

  test "should create location_address" do
    assert_difference('LocationAddress.count') do
      post location_addresses_url, params: { location_address: { city_suburb: @location_address.city_suburb, country: @location_address.country, postcode: @location_address.postcode, state: @location_address.state } }
    end

    assert_redirected_to location_address_url(LocationAddress.last)
  end

  test "should show location_address" do
    get location_address_url(@location_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_address_url(@location_address)
    assert_response :success
  end

  test "should update location_address" do
    patch location_address_url(@location_address), params: { location_address: { city_suburb: @location_address.city_suburb, country: @location_address.country, postcode: @location_address.postcode, state: @location_address.state } }
    assert_redirected_to location_address_url(@location_address)
  end

  test "should destroy location_address" do
    assert_difference('LocationAddress.count', -1) do
      delete location_address_url(@location_address)
    end

    assert_redirected_to location_addresses_url
  end
end
