require 'test_helper'

class SharespaceVenuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sharespace_venue = sharespace_venues(:one)
  end

  test "should get index" do
    get sharespace_venues_url
    assert_response :success
  end

  test "should get new" do
    get new_sharespace_venue_url
    assert_response :success
  end

  test "should create sharespace_venue" do
    assert_difference('SharespaceVenue.count') do
      post sharespace_venues_url, params: { sharespace_venue: { address_id: @sharespace_venue.address_id, brief_description: @sharespace_venue.brief_description, cost_per_day: @sharespace_venue.cost_per_day, description: @sharespace_venue.description, name: @sharespace_venue.name, overall_rating: @sharespace_venue.overall_rating, rules: @sharespace_venue.rules, surrounding_area_description: @sharespace_venue.surrounding_area_description, user_id: @sharespace_venue.user_id } }
    end

    assert_redirected_to sharespace_venue_url(SharespaceVenue.last)
  end

  test "should show sharespace_venue" do
    get sharespace_venue_url(@sharespace_venue)
    assert_response :success
  end

  test "should get edit" do
    get edit_sharespace_venue_url(@sharespace_venue)
    assert_response :success
  end

  test "should update sharespace_venue" do
    patch sharespace_venue_url(@sharespace_venue), params: { sharespace_venue: { address_id: @sharespace_venue.address_id, brief_description: @sharespace_venue.brief_description, cost_per_day: @sharespace_venue.cost_per_day, description: @sharespace_venue.description, name: @sharespace_venue.name, overall_rating: @sharespace_venue.overall_rating, rules: @sharespace_venue.rules, surrounding_area_description: @sharespace_venue.surrounding_area_description, user_id: @sharespace_venue.user_id } }
    assert_redirected_to sharespace_venue_url(@sharespace_venue)
  end

  test "should destroy sharespace_venue" do
    assert_difference('SharespaceVenue.count', -1) do
      delete sharespace_venue_url(@sharespace_venue)
    end

    assert_redirected_to sharespace_venues_url
  end
end
