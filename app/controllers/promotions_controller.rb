class PromotionsController < ApplicationController
  def show
    @keyword, @code = params[:keyword], params[:code]
    @ga_code = Affiliate.find_by_code(@code)

    cookies.permanent['promo-code'] = params[:code]
  end
end
