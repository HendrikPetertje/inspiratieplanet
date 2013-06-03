class PagesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :save]

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.where(:privacy => params[:privacy]).first
    @usersign = current_user.admin?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    if user_signed_in?
    @page = Page.where(:privacy => params[:privacy]).first
    end
  end

  # POST /pages
  # POST /pages.json
  def create
    if current_user.admin?

      @page = Page.new(params[:page])

      respond_to do |format|
        if @page.save
          format.html { redirect_to @page }
          format.json { render json: @page, status: :created, location: @page }
        else
          format.html { render action: "new" }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
     else
        respond_to do |format|
              format.html { redirect_to pages_path, notice: 'U bent niet gemachtigd deze pagina te wijzigen.' }
      end 
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to pages_path, notice: 'Pagina is succesvol aangepast.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def privacy
    @privacy = Page.last
  end
end
  
