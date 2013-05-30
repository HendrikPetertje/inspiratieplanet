class Category < ActiveRecord::Base
 	attr_accessible :title, :category_id, :articles, :content, :picture_url
  	has_many :articles
end
