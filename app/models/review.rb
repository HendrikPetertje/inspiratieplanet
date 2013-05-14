class Review < ActiveRecord::Base
  belongs_to :article
  attr_accessible :author, :content, :rating, :title
end
