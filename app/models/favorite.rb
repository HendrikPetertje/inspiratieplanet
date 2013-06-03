class Favorite < ActiveRecord::Base
  attr_accessible :article_id, :user_id

  belongs_to :article, :counter_cache => true
  belongs_to :user
end
