require 'will_paginate/array'

class DashboardController < ApplicationController
before_filter :authenticate_user!

  def user
  	@articles = current_user.articles.order("articles.created_at desc").limit(4)
  end

  def paginate
  	@articles = Article.paginate(:page => params[:page], :per_page => 4)
  end
 

  #  def user # uploadedArticles
  #  	@user = User.find(params[:id])
  #  	@userarticles = @user.articles(:limit => 4)
  #    respond_to do |format|
  #     format.html 
  #     format.json { render json: @userarticles }
  #   end
  # end

end
