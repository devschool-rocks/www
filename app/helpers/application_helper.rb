module ApplicationHelper
  def meta_title
    custom = content_for(:title)
    default = "Become a Web Developer in about 420 hour of guided instruction by an industry expert programmer!"
    "Devschool: #{custom || default}"
  end

  def meta_description
    "An online based web development bootcamp/school consisting of 40 private one on one expert sessions and 420 hours of group and self study."
  end

  def meta_keywords
    "devschool, devschool.rocks, ruby, rails, html, css, javascript, bootcamp"
  end


  def backend_url
    if Rails.env.production?
      "https://devschool.rocks"
    else
      "http://devschool.dev:4000"
    end
  end
end
