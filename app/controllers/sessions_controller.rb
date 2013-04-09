class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.validate_login(
  		params[:session][:email],
  		params[:session][:password])
  		
  if user
  	session[:user_id] = user.id
  	redirect_to articles_url
	
  else
  	flash[:status] = false
  	flash[:alert] = 'Wrong password / email'
	redirect_to login_path
  end
end

  def show
  @user = User.find(params[:user_id])
  end

  def destroy

  	session[:user_id] = nil
  	redirect_to login_path
  end
end

