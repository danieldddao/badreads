class UserMailer < ApplicationMailer
  default from: "badreadsselt@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_referral.subject
  #
  def new_referral(ref,sent_by)
    mail(to: ref, subject: 'Referral to join BadReads Applicattion' , body: " Click on the link http://badreads.herokuapp.com/ to join. A referral to join the application BadReads has been sent by "+ sent_by )
  end
  def reset_password(new_pwd,sent_to)
    mail(to: sent_to, subject: 'BadReads Reset Password', body: 'Your new password is '+ new_pwd)
  end
  def registration_confirmation(user, request)
    if Rails.env.production?
      UserMailer.default_url_options[:host] = "badreads.herokuapp.com"
    else
      UserMailer.default_url_options[:host] = request.host_with_port
    end
    @user = user
    mail(to: user.email, subject: "Registration Confirmation", body: " Thanks for registering! To confirm your registration click the following URL :" + confirm_user_email_url(user.id, user.confirm_token) )
  end
end
