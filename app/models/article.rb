class Article < ActiveRecord::Base
  attr_accessible :content, :picture, :tags, :title, :user_id, :favorite
  belongs_to :user
  has_many :favorites
  mount_uploader :picture, PictureUploader
  has_many :reviews, :order => "created_at DESC", :dependent => :destroy
end
