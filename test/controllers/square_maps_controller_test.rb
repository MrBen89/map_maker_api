require "test_helper"

class SquareMapsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get square_maps_show_url
    assert_response :success
  end
end
