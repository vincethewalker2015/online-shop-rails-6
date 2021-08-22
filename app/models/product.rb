class Product < ApplicationRecord

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  has_many :orders
  has_many :users, through: :orders

  mount_uploader :picture, PictureUploader

  def picture_size 
    if picture.size > 5.megabytes
      errors.add(:picture, "Should be less than 5mb")
    end
  end

  def self.matches(field_name, param) 
    where("#{field_name} ilike ?", "%#{param}%")
  end

  def self.search(param)
    param.strip!
    to_send_back = (name_matches(param) + description_matches(param) + price_matches(param)).uniq
    return nil unless to_send_back
    to_send_back 
  end

  def self.name_matches(param)
    matches('name', param)
  end

  def self.description_matches(param)
    matches('description', param)
  end

  def self.price_matches(param)
    matches('cast(price as text)', param)
  end
  
end
