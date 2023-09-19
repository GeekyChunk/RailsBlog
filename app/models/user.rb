require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_many :articles

  validates :username, presence: true
  validates :password, presence: true
  has_secure_password

  enum role: { normal: 0, admin: 1 }
end
