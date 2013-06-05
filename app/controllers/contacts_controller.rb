class ContactsController < ApplicationController

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
end
