class Image < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :picture, PictureUploader
  validate :picture_size

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, 'Should be less than 5MB')
    end
  end
end
