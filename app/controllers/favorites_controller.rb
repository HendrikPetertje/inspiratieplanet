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
  # PUT /favorites/1
  # PUT /favorites/1.json
  def update
    @favorite = Favorite.find(params[:id])

    respond_to do |format|
      if @favorite.update_attributes(params[:favorite])
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to favorites_url }
      format.json { head :no_content }
    end
  end
end
