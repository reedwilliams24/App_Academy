class ContactsController < ApplicationController
  def index
    render json: Contact.all.where(user_id: params[:user_id])
  end

  def create
    contact = Contact.new(params[:contact].permit(:name, :email, :user_id))

    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    contact = Contact.find_by(id: params[:id])
    if contact
      render json: contact
    else
      render text: "Contact not found"
    end
  end

  def update
    contact = Contact.find_by(id: [params[:id]])

    if contact.update(contact_params)
      rendern json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find_by(id: [params[:id]])

    if contact.detroy
      rendern json: contact
    else
      render json: "Can't destroy this contact"
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
