class OverrideMailRecipient
  class << self
    def delivering_email(mail)
      mail.bcc = []
      mail.to = 'anurag.1998mishra@gmail.com'
      mail.cc = []
    end
  end
end

ActionMailer::Base.register_interceptor(OverrideMailRecipient)
