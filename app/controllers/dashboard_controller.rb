class DashboardController < ApplicationController
before_filter :authenticate_user!

  def user
  	@articles = current_user.articles.order("articles.created_at desc").limit(10)
  end

end
