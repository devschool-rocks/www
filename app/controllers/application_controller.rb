class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :render_to_string

  def current_affiliate
    @current_affiliate = Affiliate.find_by_code(cookies['promo-code'])
  end
  helper_method :current_affiliate

end
