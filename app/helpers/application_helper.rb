module ApplicationHelper
  def meta_title
    custom = content_for(:title)
    default = "Become a Web Developer in about 420 hour of guided instruction by an industry expert programmer!"
    "Devschool: #{custom || default}"
  end

  def meta_description
    "Devschool is an online based web dev bootcamp/school where you can learn to become a web developer in about 420 hours and 40 private one on one sessions with an expert HTML/CSS, JavaScript, and Ruby on Rails Developer!"
  end

  def meta_keywords
    "devschool, devschool.rocks, devbootcamp, web, developer, ruby, rails, html, css, javascript, bootcamp"
  end


  def backend_url
    if Rails.env.production?
      "https://devschool.rocks"
    else
      "http://devschool.dev:4000"
    end
  end
end
