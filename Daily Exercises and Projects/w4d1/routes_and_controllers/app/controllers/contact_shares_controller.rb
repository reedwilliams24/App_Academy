class ContactSharesController < ApplicationController
  def index
    render json: ContactShare.all
  end

  def create
    contact_share = ContactShare.new(params[:contact_shares].permit(:contact_id, :user_id))

    if contact_share.save
      render json: contact_share
    else
      render json: contact_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  # def show
  #   contact_share = ContactShare.find_by(id: params[:id])
  #   if contact_share
  #     render json: contact_share
  #   else
  #     render text: "Contact share not found"
  #   end
  # end
  #
  # def update
  #   contact_share = ContactShare.find_by(id: [params[:id]])
  #
  #   if contact_share.update(contact_shares_params)
  #     rendern json: contact_share
  #   else
  #     render json: contact_share.errors.full_messages, status: :unprocessable_entity
  #   end
  # end
  #
  def destroy
    contact_share = ContactShare.find_by(id: [params[:id]])

    if contact_share.detroy
      rendern json: contact_share
    else
      render json: "Can't destroy this contact share"
    end
  end
  #
  # private
  # def contact_shares_params
  #   params.require(:contact_share).permit(:name, :email, :user_id)
  # end
end
