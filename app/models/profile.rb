class Profile < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :postcode, presence: true
  validates :country, presence: true
  
  belongs_to :user
end
