require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "CalledOut App"
    assert_equal full_title("Help"), "Help | CalledOut App"
    assert_equal full_title("Sign up"), "Sign up | CalledOut App"
  end
end