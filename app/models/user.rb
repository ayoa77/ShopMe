class User < ActiveRecord::Base
require 'securerandom'
mount_uploader :profile_photo, PhotoUploader
has_many :posts
has_secure_password
# validates_uniqueness_of :email, :username
# validates :password, length: { in: 6..24 }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.username = auth.info.name
      user.username = auth.info.name
      user.profile_photo = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = SecureRandom.urlsafe_base64
      user.save!
    end
  end
end
