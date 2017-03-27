class Post < ApplicationRecord
  include PgSearch
  mount_uploader :post_photo, PhotoUploader
  belongs_to :user, dependent: :destroy
  validates_presence_of :post_photo, :description, :price
  pg_search_scope :search_posts, :against => :description,
                 :using => {
   tsearch:    {dictionary: 'english', prefix: true},
   trigram:    {threshold:  0.3},
   dmetaphone: {}
 }


end
