class UserMailer < ApplicationMailer
  default from: "badreadsselt@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_referral.subject
  #
  def new_referral(ref,sent_by)
    mail(to: ref, subject: 'Referral to join BadReads Applicattion by '+ sent_by)do |format|
    format.html { render layout: 'new_referral' }
    format.text { render layout: 'new_referral' }
  end
  end
end
