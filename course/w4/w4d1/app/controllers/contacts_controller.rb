class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render json: @contacts
  end

  def show
    @contact = Contact.find_by_id(params[:id])
    render json: @contact
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.nil?
      render @contact.errors.full_messages
    else
      # @contact.name = params[:contact][:name]
      # @contact.email = params[:contact][:email]
      # @contact.user_id = params[:contact][:user_id]
      @contact.update(contact_params)
    end

    Contact.find(params[:id])
    render json: @contact
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    @contact = Contact.find(params[:id])

    if @contact.nil?
      render text: "user does not exist"
    else
      Contact.find(params[:id]).destroy
    end

    render json: @contact
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
