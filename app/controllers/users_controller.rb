class UsersController < ApplicationController
  before_filter :authenticate_user, :except => [:create, :index]
  before_filter :find_user, :except => [:index, :create]
  
  def index
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
    render :json => @user
  end

  def update
    @user.update_attributes(params[:user])
    render :json => user
  end

  def destroy
    @user.destroy
    render :text => "successfully destroyed"
  end
  
  protected
    def find_user
      @user = User.find(params[:id])
    end
end