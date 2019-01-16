class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :gender, presence: true
  validates :age, presence: true
  validates :introduction, presence: false
end
