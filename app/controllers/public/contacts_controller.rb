class Public::ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def index
  end

  def show
  end

end
