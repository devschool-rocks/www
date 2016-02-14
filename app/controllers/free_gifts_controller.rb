class FreeGiftsController < ApplicationController
  def create
    p = [params[:name], params[:email]]
    FreeGiftMailer.notify_applicant(*p).deliver_now
    redirect_to :gift_claimed
    cookies.permanent['free-session-claimed'] = 1
  end
end
