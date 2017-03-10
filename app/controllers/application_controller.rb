class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def current_user
    @current_user = User.find_by(session_token: session[:session_token])
    p @current_user
  end

  def login(user)
    user.reset_token!
    session[:session_token] = user.session_token
    puts session[:session_token]
    puts user.session_token
    current_user
  end

  def logout
    current_user.reset_token!
    @current_user = nil
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end
end
