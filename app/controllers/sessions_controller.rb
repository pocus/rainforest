class SessionsController < ApplicationController
  def new
  	#nothing needed here
  	#a session is not an object
  end

  def create #log in
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password]) #if user exists and password OK then
  		session[:user_id] = user.id  #set the value of the :userid hash to the current user.id.
  		redirect_to products_path , :notice => "User #{user.id} logged in!"
  	else
  		render :new #render new user if login fail
  	end
  end

  def destroy #log out
  	session[:user_id] = nil #set the :userid hash to nil
  	redirect_to products_path, :notice => "logged in!"
  end
end
