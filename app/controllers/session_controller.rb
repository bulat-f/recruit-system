class SessionController < ApplicationController
  def new
    redirect_to root_path if signed_in?
  end

  def create
    if session_params[:password] == ENV['ADMIN_PASSWORD']
      session[:jwt_token] = JsonWebToken.encode(username: 'admin')
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session[:jwt_token] = nil
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:password)
  end
end
