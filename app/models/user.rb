class User < ApplicationRecord
  has_many :interfaces

  def self.create_with_omniauth(auth)
    create! do |user|
      user.first_name = auth.info.first_name
      user.last_name  = auth.info.last_name
      user.avatar     = auth.info.image
      user.email      = auth.info.email
      user.name       = auth.info.name
      user.provider   = auth['provider']
      user.uid        = auth['uid']
    end
  end

end
