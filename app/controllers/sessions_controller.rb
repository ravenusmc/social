class SessionsController < ApplicationController
  def new 
  end 

  def create 
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Log In Successful"
    else 
      flash.now.alert = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil 
    redirect_to root_url, notice: "Log Out Successful!"
  end
end


