class CreateSightingRecords < ActiveRecord::Migration
  def change
    create_table :sighting_records do |t|
      t.string :order
      t.string :family
      t.string :genus_species
      t.string :common_name
      t.string :location
      t.string :date
      t.text :notes
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :sighting_records, [:user_id, :order]
  end
end
