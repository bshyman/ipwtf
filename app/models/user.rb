class User < ApplicationRecord
  has_many :interfaces

  def self.create_with_omniauth(auth)
    create! do |user|
      user.first_name = auth['first_name']
      user.last_name  = auth['last_name']
      user.avatar     = auth['image']
      user.email      = auth['email']
      user.provider   = auth['provider']
      user.uid        = auth['uid']
    end
  end

end
