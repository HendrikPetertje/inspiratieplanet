class ReviewsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :save]
  # GET /reviews
  # GET /reviews.json
  
  def create
   @article = Article.find(params[:article_id])
   @review = @article.reviews.create(params[:review])
    
    redirect_to article_path(@article)

  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @article = Article.find(params[:article_id])
    @review = @article.reviews.find(params[:id])
    @review.destroy

    redirect_to article_path(@article)
    end
end

