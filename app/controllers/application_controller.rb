class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= Token.find_by_value(params[:token]).user
  end

  def logged_in?

  end
end
