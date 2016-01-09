$(document).ready ->
  promoCode = Cookies.get('promo-code')
  return unless promoCode
  console.debug "Reseller code detected: #{promoCode}"

  form = $("form#apply")[0]
  return unless form

  $(form).find("input#enrollment_promo_code").val(promoCode)
  console.debug "Application form detected and promo code #{promoCode} has been injected into it"
