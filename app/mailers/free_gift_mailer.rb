class FreeGiftMailer < ApplicationMailer
  default from: "hello@devschool.rocks"

  def notify_applicant(name, email)
    @name, @email = name, email
    mail(to:      email,
         subject: "Congrats! 🎉 You have been invited for a free Devschool preview and interview!")
  end
end
