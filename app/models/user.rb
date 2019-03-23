require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  has_many :interfaces

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password            = Password.create(new_password)
    self.password_digest = @password
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.first_name = auth.info.first_name
      user.last_name  = auth.info.last_name
      user.avatar     = auth.info.image
      user.email      = auth.info.email
      user.name       = auth.info.name
      user.provider   = auth['provider']
      user.uid        = auth['uid']
      user.password   = SecureRandom.hex(10)
    end
  end

  def name
    self.first_name + ' ' + self.last_name
  end

end
