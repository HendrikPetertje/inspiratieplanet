class DashboardController < ApplicationController
before_filter :authenticate_user!

  def user
  	@articleslimit = current_user.articles.order("articles.created_at desc").limit(4)
  	@articlesall = current_user.articles.order("articles.created_at desc")
  	
  	respond_to do |format|
  		format.html
	  	format.json { render json: @articlesall }
  	end
  end

end
