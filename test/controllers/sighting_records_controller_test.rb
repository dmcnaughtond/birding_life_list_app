require 'test_helper'

class SightingRecordsControllerTest < ActionController::TestCase

  def setup
    @sighting_record = sighting_records(:grebe)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'SightingRecord.count' do
      post :create, sighting_record: { order: "Gaviiformes",
                                      family: "Podicipedidae",
                                      genus_species: "Podiceps auritus",
                                      common_name: "Horned Grebe",
                                      location: "Lake Michigan, Chicago, Illinois",
                                      date: "2014-03-08",
                                      notes: "Singleton." }
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
