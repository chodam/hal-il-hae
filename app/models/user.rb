class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth[:info][:name]
    end
  end
  
  def largeimage
    "http://graph.facebook.com/#{self.uid}/picture?type=large"
  end
  
  def normalimage
    "http://graph.facebook.com/#{self.uid}/picture?type=normal"
  end
  
  def smallimage
    "http://graph.facebook.com/#{self.uid}/picture?type=small"
  end
end