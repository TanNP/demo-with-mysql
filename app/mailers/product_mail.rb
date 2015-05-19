class ProductMail < ActionMailer::Base
  default from: "tannp92@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mail.addnew.subject
  #
  def addnew(current_user)
    @greeting = "Hi"
    mail(:to => current_user.email,:subject => "you have added new product")
  end
end
