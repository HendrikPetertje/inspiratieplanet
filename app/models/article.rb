require 'file_size_validator' 

class Article < ActiveRecord::Base
  attr_accessible :content, :picture, :tags, :title, :user_id
  belongs_to :user
  has_many :favorites
  mount_uploader :picture, PictureUploader
  validates :picture, :presence => true, :file_size => { :maximum => 5.megabytes.to_i }
  
  has_many :reviews, :order => "created_at DESC", :dependent => :destroy
end
