require 'test_helper'

class CollabSpaceListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collab_space_listing = collab_space_listings(:one)
  end

  test "should get index" do
    get collab_space_listings_url
    assert_response :success
  end

  test "should get new" do
    get new_collab_space_listing_url
    assert_response :success
  end

  test "should create collab_space_listing" do
    assert_difference('CollabSpaceListing.count') do
      post collab_space_listings_url, params: { collab_space_listing: { address_id: @collab_space_listing.address_id, brief_description: @collab_space_listing.brief_description, cost_per_day: @collab_space_listing.cost_per_day, description: @collab_space_listing.description, name: @collab_space_listing.name, overall_rating: @collab_space_listing.overall_rating, rules: @collab_space_listing.rules, surrounding_area_description: @collab_space_listing.surrounding_area_description, user_id: @collab_space_listing.user_id } }
    end

    assert_redirected_to collab_space_listing_url(CollabSpaceListing.last)
  end

  test "should show collab_space_listing" do
    get collab_space_listing_url(@collab_space_listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_collab_space_listing_url(@collab_space_listing)
    assert_response :success
  end

  test "should update collab_space_listing" do
    patch collab_space_listing_url(@collab_space_listing), params: { collab_space_listing: { address_id: @collab_space_listing.address_id, brief_description: @collab_space_listing.brief_description, cost_per_day: @collab_space_listing.cost_per_day, description: @collab_space_listing.description, name: @collab_space_listing.name, overall_rating: @collab_space_listing.overall_rating, rules: @collab_space_listing.rules, surrounding_area_description: @collab_space_listing.surrounding_area_description, user_id: @collab_space_listing.user_id } }
    assert_redirected_to collab_space_listing_url(@collab_space_listing)
  end

  test "should destroy collab_space_listing" do
    assert_difference('CollabSpaceListing.count', -1) do
      delete collab_space_listing_url(@collab_space_listing)
    end

    assert_redirected_to collab_space_listings_url
  end
end
