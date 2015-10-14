class SightingRecord < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PictureUploader
  #default_scope -> { order(order: :asc, family: :asc, genus_species: :asc) }
  validates :user_id, presence: true
  validates :order, presence: true 
  validates :family, presence: true
  validates :genus_species, presence: true
  validates :common_name, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :notes, presence: true, length: { maximum: 65 }
  validate  :picture_size

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
