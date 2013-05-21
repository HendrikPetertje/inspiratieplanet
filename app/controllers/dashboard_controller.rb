class DashboardController < ApplicationController
before_filter :authenticate_user!

  def user
  	@articles = current_user.articles.order("articles.created_at desc").limit(10)
  end

  def admin
  	if current_user.admin
  	 @falsearticles = Article.find(:all, :conditions => { :accepted => false })
  	else
  	 redirect_to '/dashboard/user', notice: 'U bent geen admin'
  	end
  end

  def manage_user
  end

end
