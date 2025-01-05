# frozen_string_literal: true

class OverrideMailRecipient
  class << self
    def delivering_email(mail)
      mail.bcc = 'anurag1998mishra+alphablog@gmail.com'
    end
  end
end

ActionMailer::Base.register_interceptor(OverrideMailRecipient)
