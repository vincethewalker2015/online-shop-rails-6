class Product < ApplicationRecord

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  has_many :orders
  has_many :users, through: :orders
  mount_uploader :picture, PictureUploader

  # Validates the size of uploaded picture
  def picture_size 
    if picture.size > 5.megabytes
      errors.add(:picture, "Should be less than 5MB")
    end
  end
end
