class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    if logged_in? 
      @current_user ||= Token.find_by_value(params[:token]).user
    else
      nil
    end
  end

  def logged_in?
    !Token.find_by_value(params[:token]).nil?
  end

  def authenticate_user
    id = params[:user_id]
    id ||= params[:id]
    
    if logged_in?
      if self.current_user.id != id.to_i
        render :text => "you can't do that", status: :forbidden
      end
    else
      render :text => "you must be signed in", status: :forbidden
    end
  end
end
