require 'test_helper'

class ChatRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get chatrooms_show_url
    assert_response :success
  end

end
