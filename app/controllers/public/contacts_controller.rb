class Public::ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.save
      redirect_to contacts_thanks_path
    else
      render 'new'
    end
  end

  def thanks
    @user = current_user
  end

  def index
    @user = current_user
    @contacts = @user.contacts
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :body, :user_id)
  end

end
