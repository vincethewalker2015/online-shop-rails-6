class Category < ApplicationRecord

  has_many :product_categories
  has_many :products, through: :product_categories

  mount_uploader :picture, PictureUploader

  def picture_size 
    if picture.size > 5.megabytes
      errors.add(:picture, "Should be less than 5mb")
    end
  end
  
end
