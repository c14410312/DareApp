require 'test_helper'

class UserdaresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userdare = userdares(:one)
  end

  test "should get index" do
    get userdares_url
    assert_response :success
  end

  test "should get new" do
    get new_userdare_url
    assert_response :success
  end

  test "should create userdare" do
    assert_difference('Userdare.count') do
      post userdares_url, params: { userdare: { name: @userdare.name, user_id: @userdare.user_id } }
    end

    assert_redirected_to userdare_url(Userdare.last)
  end

  test "should show userdare" do
    get userdare_url(@userdare)
    assert_response :success
  end

  test "should get edit" do
    get edit_userdare_url(@userdare)
    assert_response :success
  end

  test "should update userdare" do
    patch userdare_url(@userdare), params: { userdare: { name: @userdare.name, user_id: @userdare.user_id } }
    assert_redirected_to userdare_url(@userdare)
  end

  test "should destroy userdare" do
    assert_difference('Userdare.count', -1) do
      delete userdare_url(@userdare)
    end

    assert_redirected_to userdares_url
  end
end
