class Review < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  attr_accessible :author, :content, :rating, :title, :article_id, :review, :user_id, :avatar

  validates :user_id, :presence => true
end
