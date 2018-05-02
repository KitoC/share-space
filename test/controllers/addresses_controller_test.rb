require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:one)
  end

  test "should get index" do
    get addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_address_url
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post addresses_url, params: { address: { address_identifier: @address.address_identifier, address_type: @address.address_type, city_suburb: @address.city_suburb, country: @address.country, postcode: @address.postcode, state: @address.state, street_name: @address.street_name, street_num: @address.street_num, street_type: @address.street_type, unit_num: @address.unit_num } }
    end

    assert_redirected_to address_url(Address.last)
  end

  test "should show address" do
    get address_url(@address)
    assert_response :success
  end

  test "should get edit" do
    get edit_address_url(@address)
    assert_response :success
  end

  test "should update address" do
    patch address_url(@address), params: { address: { address_identifier: @address.address_identifier, address_type: @address.address_type, city_suburb: @address.city_suburb, country: @address.country, postcode: @address.postcode, state: @address.state, street_name: @address.street_name, street_num: @address.street_num, street_type: @address.street_type, unit_num: @address.unit_num } }
    assert_redirected_to address_url(@address)
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete address_url(@address)
    end

    assert_redirected_to addresses_url
  end
end
