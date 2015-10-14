class AddPictureToSightingRecords < ActiveRecord::Migration
  def change
    add_column :sighting_records, :picture, :string
  end
end
