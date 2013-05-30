class ArticlesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :save]
  # GET /articles
  # GET /articles.json
  def index
    @title = "Inspiratieplanet - Alle artikelen"
    @subtitle = "Alle artikelen"
    @articles = Article.find(:all, :conditions => { :accepted => true })
     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles.to_json(
        :include => [
          
          :reviews => {:include => { :user => {:except => [:admin, :email, :updated_at, :created_at]  } }},
          :user => {:except => [:admin, :email, :updated_at, :created_at]}
        ]
      )}
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @subtitle = @article.title
    @title = "Inspiratieplanet - " + @article.title
    @userName = @article.user.name
    if user_signed_in?
      @showheart = Favorite.exists?(:user_id => current_user.id, :article_id => @article.id)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article.to_json(
        :include => [
          
          :reviews, 
          :user => {:except => [:admin, :email, :updated_at, :created_at]}
        ]

      )}
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    @title = "Inspiratieplanet - Nieuw artikel"
    @subtitle = "nieuw artikel"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    if current_user.id == @article.user_id
      @article = Article.find(params[:id])
    elsif current_user.admin?
      @article = Article.find(params[:id])
    else
      @article = Article.find(params[:id])
      redirect_to @article, notice: 'U kunt dit artikel niet bewerken.'
    end
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
    @article = Article.find(params[:id])

    if current_user.id == @article.user_id
      # Remove favorites linked to the article
        if @article.favorites.count > 0
        @article.favorites.each do |favorite|
          favorite.destroy
        end
      end

      # remove reviews linked to the article
      if @article.reviews.count > 0
        @article.reviews.each do |review|
          review.destroy
        end
      end

      # Remove article
      @article.destroy
    
    respond_to do |format|
        format.html { redirect_to articles_url }
        format.json { head :no_content }
      end

    elsif current_user.admin?
      # Remove favorites linked to the article
        if @article.favorites.count > 0
        @article.favorites.each do |favorite|
          favorite.destroy
        end
      end

      # remove reviews linked to the article
      if @article.reviews.count > 0
        @article.reviews.each do |review|
          review.destroy
        end
      end

      # Remove article
      @article.destroy

      respond_to do |format|
        format.html { redirect_to articles_url }
        format.json { head :no_content }
      end
    
    else
      respond_to do |format|
        format.html { redirect_to @article, notice: 'U hebt geen toegang dit artikel te verwijderen' }
        format.json { head :no_content }
      end
    end
  end

  def randomArticle
    
  end

  def accept
    @article = Article.find(params[:id])
    if current_user.admin?
      @article.update_attribute(:accepted, true)
      redirect_to '/dashboard/admin'
    else
      redirect_to @article, notice: 'U hebt geen toegang tot de acceptatie-pagina'
    end
  end

  def reject
    @article = Article.find(params[:id])
    if current_user.admin?
      @article.update_attribute(:accepted, false)
      redirect_to '/dashboard/admin'
    else
      redirect_to @article, notice: 'U hebt geen toegang tot de weiger-pagina'
    end
  end

end
