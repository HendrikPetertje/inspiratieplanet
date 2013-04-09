class UsersController < ApplicationController
  def index
  end

  def show
  end

 def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])

  	if @user.save
  		flash[:status] = true
  		flash[:alert] = 'You succesfully registered!'
  	else
  		flash[:status] = false
  		flash[:alert] = @user.errors.full_messages
 	end

 	redirect_to articles_url

	end
end
