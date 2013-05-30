class Review < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  attr_accessible :author, :content, :rating, :title, :article_id, :review, :user_id, :picture

  validates :user_id, :presence => true

end
