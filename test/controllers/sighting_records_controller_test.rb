require 'test_helper'

class SightingRecordsControllerTest < ActionController::TestCase

  def setup
    @sighting_record = sighting_records(:bluebird)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'SightingRecord.count' do
      post :create, sighting_record: { order: "Blueforme",
                                      family: "Blutilidae",
                                      genus_species: "Bluetilis bluetilis",
                                      common_name: "Blue bluebird",
                                      location: "The sky",
                                      date: "5-10-2000",
                                      notes: "Very blue." }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'SightingRecord.count' do
      delete :destroy, id: @sighting_record
    end
    assert_redirected_to login_url
  end
end
