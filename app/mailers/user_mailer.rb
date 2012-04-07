class UserMailer < ActionMailer::Base
  default from: "do@zmiany.pl"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  
  def remind_email(remind)
    @remind = remind
    mail to: remind.user.email, from: "dupa"
  end
  
  def notify_email(user)
    mail to: user.email
  end
  
end
