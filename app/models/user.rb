class User < ApplicationRecord
  has_secure_password
  has_many :items

  validates :email, presence: true, uniqueness: true

  def self.login(args)
    user = User.find_by(email: args[:email])

    user ? user.authenticate(args[:password]) : false
  end
end
