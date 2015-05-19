class UserMailer < ActionMailer::Base
  default from: "tannp92@gmail.com"

  def thanksForRegister(user)
    mail(:to => user.email,:subject => "welcome")
  end
end