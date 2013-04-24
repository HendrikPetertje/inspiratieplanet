class Article < ActiveRecord::Base
  attr_accessible :content, :picture, :tags, :title, :user_id
  mount_uploader :picture, PictureUploader
end
