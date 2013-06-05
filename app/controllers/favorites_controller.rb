class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(params[:favorite].merge(
                                  :owner_id => params[:user_id]))
    if favorite.save
      render :json => favorite
    else
      render :json => favorite.errors.full_messages, status: :bad_request
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    if favorite
      favorite.destroy
      render :text => "successfully destroyed"
    else
      render :json => "favorite not found", status: :not_found
    end
  end
end
