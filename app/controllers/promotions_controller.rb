class PromotionsController < ApplicationController
  def show
    @keyword, @code = params[:keyword], params[:code]
    cookies.permanent['promo-code'] = params[:code]
  end
end
