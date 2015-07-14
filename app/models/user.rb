class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 , maximum: 14}

  has_secure_password
end
