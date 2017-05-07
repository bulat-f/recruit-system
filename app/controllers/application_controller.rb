class ApplicationController < ActionController::Base
  require 'json_web_token'

  protect_from_forgery with: :exception

  protected

  def authenticate!
    redirect_to login_path unless signed_in?
  end

  def signed_in?
    decode_username == 'admin'
  end

  def decode_username
    (token = session[:jwt_token]) && JsonWebToken.decode(token)[0]['username']
  rescue
    nil
  end
end
