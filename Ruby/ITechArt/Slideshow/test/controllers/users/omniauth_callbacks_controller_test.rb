require 'test_helper'

class Users::OmniauthCallbacksControllerTest < ActionController::TestCase
  test "should get google" do
    get :google
    assert_response :success
  end

  test "should get twitter" do
    get :twitter
    assert_response :success
  end

  test "should get linkedin" do
    get :linkedin
    assert_response :success
  end

end
