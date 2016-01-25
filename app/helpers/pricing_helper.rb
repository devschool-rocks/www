module PricingHelper

  def prepay_price
    product.prepay_price - promo_discount.to_i
  end

  def financed_price
    product.financed_price - promo_discount.to_i
  end

  def payment_amount
    financed_price.to_f / product.payment_count.to_f
  end

  def payment_count
    product.payment_count
  end

  def prepay_savings_amount
    financed_price - prepay_price
  end

  def finance_cost
    product.finance_cost
  end

  def discounted?
    affiliate && affiliate.discount > 0
  end

  def product
    Product
  end

  def promo_discount
    affiliate && affiliate.discount
  end

  def referrer_name
    affiliate && affiliate.name
  end

  def affiliate
    Affiliate.find_by_code(cookies['promo-code'])
  end

end
