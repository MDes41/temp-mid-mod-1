class User < ApplicationRecord

  validates :email_address, uniqueness: true
  validates_confirmation_of :password_digest
end
