class UsersController < ApplicationController
  def index
#    render :text => "I'm in the index action!"
#    render :json => params#.to_jso
    render :json => User.all
  end

  def create
    user = User.new(params[:user])
    if user.save
      render :json => user
    else
      render :json => user.errors.full_messages, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    render :json => user
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    render :json => user
  end

  def destroy
    user = User.find(params[:id])
    if user
      user.destroy
      render :text => "successfully destroyed"
    else
      render :json => "user not found", status: :not_found
    end
  end
end