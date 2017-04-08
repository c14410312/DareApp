require 'test_helper'

class TopusersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get topusers_index_url
    assert_response :success
  end

end
