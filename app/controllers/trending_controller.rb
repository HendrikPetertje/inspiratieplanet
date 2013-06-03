class TrendingController < ApplicationController

	def index
		@articles = Article.where("created_at < ?", DateTime.now - 1.week).find(:all, :order => "favorites_count DESC")
	end

end
