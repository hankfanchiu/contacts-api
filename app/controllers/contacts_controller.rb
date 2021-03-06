class ContactsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: user.all_contacts
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages,
        status: :unprocessable_entity
    end
  end

  def show
    contact = Contact.find(params[:id])
    render json: contact
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: contact
  end

  def update
    contact = Contact.find(params[:id])
    contact.update(contact_params)
    render json: contact
  end

  def favoritors
    contact = Contact.find(params[:id])
    render json: contact.favoritors
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
