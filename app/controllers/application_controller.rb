class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= Token.find_by_value(params[:token]).user
  end

  def logged_in?

  end

  def authenticate_user
    unless Token.find_by_value(params[:token])
      render :json => status: :forbidden
    end
  end
end
