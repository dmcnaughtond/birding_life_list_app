require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.sighting_records.count.to_s, response.body
    @user.sighting_records.paginate(page: 1).each do |sighting_record|
      assert_match sighting_record.order, response.body
      assert_match sighting_record.family, response.body
      assert_match sighting_record.genus_species, response.body
      assert_match sighting_record.common_name, response.body
      assert_match sighting_record.location, response.body
      assert_match sighting_record.date, response.body
      assert_match sighting_record.notes, response.body
    end
  end
end
