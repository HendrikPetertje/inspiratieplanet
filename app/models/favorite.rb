class Favorite < ActiveRecord::Base
  attr_accessible :article_id, :user_id

  belongs_to :users
  belongs_to :articles
end
