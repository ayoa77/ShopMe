class Post < ApplicationRecord
  mount_uploader :post_photo, PhotoUploader
  belongs_to :user, dependent: :destroy
  validates_presence_of :post_photo, :description, :price
end
