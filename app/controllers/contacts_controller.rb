class ContactsController < ApplicationController
  before_filter :authenticate_user
  
  def favorites
    favorites = Favorite.find_all_by_owner_id(params[:user_id])
                        .includes(:contacts)
    render :json => favorites.map do |fav|
      fav.contact
    end
  end

  def index
    contacts = Contact.find_all_by_owner_id(params[:user_id])

    render :json => contacts
  end
  
  def update
    contact = Contact.find(params[:id])
    contact.update_attributes(params[:contact])
    render :json => contact
  end

  def show
    contact = Contact.find(params[:id])
    render :json => contact
  end

  def create
    contact = Contact.new(params[:contact])
    contact.owner_id = params[:user_id]
    if contact.save
      render :json => contact
    else
      render :json => contact.errors.full_messages, status: :bad_request
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    if contact
      contact.destroy
      render :text => "successfully destroyed"
    else
      render :json => "contact not found", status: :not_found
    end
  end
  
  def search
    contacts = Contact.where("owner_id = ? AND \"#{params[:search_type]}\" LIKE ?",
                              current_user.id, "%#{params[:value]}%")
    render :json => contacts
  end
end
