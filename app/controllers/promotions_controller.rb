class PromotionsController < ApplicationController
  def show
    @affiliate = Affiliate.find_by_code(params[:code])
    cookies.permanent['promo-code'] = @affiliate.code
  end
end
