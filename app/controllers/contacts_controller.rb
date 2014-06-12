class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(secure_params)
    if @contact.valid?
      UserMailer.contact_email(@contact).deliver
      redirect_to root_path
      flash[:notice] = "Message sent from #{@contact.name}."
    else
      render root_path
      flash[:notice] = "Message failed to send"
    end
  end


  private

  def secure_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
