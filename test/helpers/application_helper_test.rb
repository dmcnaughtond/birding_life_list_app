require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Birder's Life List App"
    assert_equal full_title("Help"), "Help | Birder's Life List App"
    assert_equal full_title("About"), "About | Birder's Life List App"
    assert_equal full_title("Contact"), "Contact | Birder's Life List App"
    assert_equal full_title("Sign up"), "Sign up | Birder's Life List App"
  end
end