class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.get_in_touch.subject
  #
  def contact_email(contact)
    @contact = contact
    mail(to: "kstag07@yahoo.com", from: @contact.email, :subject =>
    "Portfolio Contact")
  end
end

