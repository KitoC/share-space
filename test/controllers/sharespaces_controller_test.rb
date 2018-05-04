require 'test_helper'

class SharespacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sharespace = sharespaces(:one)
  end

  test "should get index" do
    get sharespaces_url
    assert_response :success
  end

  test "should get new" do
    get new_sharespace_url
    assert_response :success
  end

  test "should create sharespace" do
    assert_difference('Sharespace.count') do
      post sharespaces_url, params: { sharespace: { cost: @sharespace.cost, description: @sharespace.description, sharespace_venue_id: @sharespace.sharespace_venue_id, type: @sharespace.type } }
    end

    assert_redirected_to sharespace_url(Sharespace.last)
  end

  test "should show sharespace" do
    get sharespace_url(@sharespace)
    assert_response :success
  end

  test "should get edit" do
    get edit_sharespace_url(@sharespace)
    assert_response :success
  end

  test "should update sharespace" do
    patch sharespace_url(@sharespace), params: { sharespace: { cost: @sharespace.cost, description: @sharespace.description, sharespace_venue_id: @sharespace.sharespace_venue_id, type: @sharespace.type } }
    assert_redirected_to sharespace_url(@sharespace)
  end

  test "should destroy sharespace" do
    assert_difference('Sharespace.count', -1) do
      delete sharespace_url(@sharespace)
    end

    assert_redirected_to sharespaces_url
  end
end
