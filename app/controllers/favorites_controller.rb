class FavoritesController < ApplicationController
  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @favorites }
    end
  end

  def create
    current_user.favorites.create(:article_id => params[:article_id])
    render :layout => false
  end

  def show
  end

  def destroy
    current_user.favorites.where(:article_id => params[:article_id]).first.destroy
    render :layout => false
  end
end
