class FreeGiftsController < ApplicationController
  def create
    FreeGiftMailer.notify_jim(params[:name], params[:twitter], params[:email])
    redirect_to :gift_claimed
    cookies.permanent['free-session-claimed'] = 1
  end
end
