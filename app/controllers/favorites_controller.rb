class FavoritesController < ApplicationController

  def create
    user = User.new(params[:user])
    if user.save
      render :json => user
    else
      render :json => user.errors.full_messages, status: :bad_request
    end
  end

  def destroy

  end
end
