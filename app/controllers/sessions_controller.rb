class SessionsController < ApplicationController
  def new
  end

  def create
  	if user = User.authenticate(params[:email], params[:password])
  		session[:user_id] = user.id
  		session[:is_vendor] = user.is_vendor
  		redirect_to items_url, notice: "Signed in!"
  	else
  		flash.now.alert = "Invalid email or password"
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to items_url, :notice => "Logged out!"
  end
end
