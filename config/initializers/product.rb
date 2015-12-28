module Product
  extend self

  def base_price
    4988
  end

  def finance_cost
    1000
  end

  def session_count
    42
  end

  def session_length
    50
  end

  def payment_count
    6
  end

  def prepay_price
    base_price
  end

  def financed_price
    base_price + finance_cost
  end

  def prepay_savings_amount
    financed_price - prepay_price
  end

  def payment_amount
    financed_price / payment_count
  end
end
