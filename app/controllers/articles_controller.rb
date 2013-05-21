class ArticlesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :save]
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.find(:all, :conditions => { :accepted => true })
    # uit eindelijke limiet is 16
    @randomarticle = Article.all(:order => "RANDOM()", :limit => 5)
     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @randomarticle }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @userName = @article.user.name
    if user_signed_in?
      @showheart = Favorite.exists?(:user_id => current_user.id, :article_id => @article.id)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id
    
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    # verwijder gebruiker
    # @article = Article.find(params[:id])
    # @article.destroy
    
    # Remove favorites linked to the article
    if @artcile.favorites.inculde?(@artcile.favorites.article_id)
      u_fav = @article.favorites
      u_fav.each do |favorite|
        favorite.destroy
      end
    end

    # remove reviews linked to the article

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  def randomArticle
    
  end

end
