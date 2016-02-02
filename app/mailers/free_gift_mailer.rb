class FreeGiftMailer < ApplicationMailer
  default from: "do-not-reply@devschool.rocks"

  def notify_jim(name, email)
    @name, @email = name, email
    mail(to:      "jim@devschool.rocks",
         subject: "#{name} wants a free preview session!")
  end

  def notify_previewer(name, email)
    @name, @email = name, email
    mail(to:      email,
         subject: "You are almost done! Claim your freeevschool preview session now!")
  end
end
