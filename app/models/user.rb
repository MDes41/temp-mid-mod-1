class User < ApplicationRecord
  has_secure_password
  validates :email_address, uniqueness: true
  has_many :links
end
