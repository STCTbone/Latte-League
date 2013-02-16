class SessionsController < ApplicationController
  def new
  end

  def create
  	if user = User.authenticate(params[:email], params[:password])
  		session[:user_id] = user.id
  		session[:is_vendor] = user.is_vendor
  		redirect_to my_orders_url, notice: "Signed in!"
  	else
  		flash.now.alert = "Invalid email or password"
  		render 'new'
  	end
  end

  def destroy
  	reset_session
  	redirect_to items_url, :notice => "Logged out!"
  end
end
