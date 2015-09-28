require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | Birder's Life List App"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | Birder's Life List App"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | Birder's Life List App"
  end
end
