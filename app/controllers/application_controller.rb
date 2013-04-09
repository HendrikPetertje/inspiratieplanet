class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def check_login
  	if session[:user_id]
  		flash[:status] = false
  		flash[:alert] = 'You need to be logged in first'

  		redirect_to login_path
  	else
  		@user = User.find(session[:user_id])
  		$user_first_name = @user_first_name

  	end
  end
end
