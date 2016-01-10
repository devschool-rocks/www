class PromotionsController < ApplicationController
  def show
    @keyword, @code = params[:keyword], params[:code]
    cookies.permanent['promo-code'] = params[:code]
    redirect_to :root
  end
end
