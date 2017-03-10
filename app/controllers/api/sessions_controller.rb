class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by(params[:username])
    if @user.save
      login(@user)
      render json: ["logged in"] #api_user_url(@user.id)
    else
      render json: ["Invalid credentials"], status: 422
    end
  end

  def destroy
    if logged_in?
      logout
      render json: ["Logout: Success!"]
    else
      render json: ["No user to log out"], status: 404
    end
  end
end
