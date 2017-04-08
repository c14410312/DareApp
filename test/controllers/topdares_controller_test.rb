require 'test_helper'

class TopdaresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get topdares_index_url
    assert_response :success
  end

end
