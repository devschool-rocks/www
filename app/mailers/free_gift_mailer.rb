class FreeGiftMailer < ApplicationMailer
  def notify_jim(name, twiiter, email)
    @name, @twitter, @email = first, twitter, email
    mail(to:      "jim@devschool.rocks",
         subject: "#{name} (#{twitter}) wants a free preview session!")
  end
end
