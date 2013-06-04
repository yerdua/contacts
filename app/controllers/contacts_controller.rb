class ContactsController < ApplicationController
  def create
    user = Contact.new(params[:contact])
    if user.save
      render :json => user
    else
      render :json => user.errors.full_messages, status: :bad_request
    end
  end
end
