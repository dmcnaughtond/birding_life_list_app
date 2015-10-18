require 'test_helper'

class SightingRecordTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @sighting_record = @user.sighting_records.build(order: "Passeriformes", 
                                          family: "Vireonidae", 
                                          genus_species: "Vireo olivaceus", 
                                          common_name: "Red-eyed Vireo", 
                                          location: "Hyde Park, Chicago, IL", 
                                          date: "15-5-2015", 
                                          notes: "Possibly injured.",
                                          user_id: @user.id)
  end

  test "should be valid" do
    assert @sighting_record.valid?
  end

  test "user id should be present" do
    @sighting_record.user_id = nil
    assert_not @sighting_record.valid?
  end

  test "notes should be at most 65 characters" do
    @sighting_record.notes = "a" * 66
    assert_not @sighting_record.valid?
  end

end
