require 'spec_helper'
require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "new_referral" do
    let(:mail) { UserMailer.new_referral("to@example.org", "Hi") }

    it "renders the headers" do
      expect(mail.subject).to eq("Referral to join BadReads Applicattion")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["badreadsselt@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(" Click on the link http://badreads.herokuapp.com/ to join. A referral to join the application BadReads has been sent by Hi")
    end
  end
  
  describe "reset password" do
    let(:mail) { UserMailer.reset_password("newpassword","to@example.org") }

    it "renders the headers" do
      expect(mail.subject).to eq("BadReads Reset Password")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["badreadsselt@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Your new password is newpassword")
    end
  end
end
