class PromotionsController < ApplicationController
  def show
    @affiliate = Affiliate.find_by_code(params[:code])
    redirect_to :root and return if @affiliate.nil?
    cookies.permanent['promo-code'] = @affiliate.code
  end
end
