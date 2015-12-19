module ApplicationHelper
  def meta_title
    custom = content_for(:title)
    default = "Become a Web Developer in about 420 hour of guided instruction by an industry expert programmer!"
    "Devschool: #{custom || default}"
  end

  def backend_url
    if Rails.env.production?
      "https://devschool.rocks"
    else
      "http://devschool.dev:4000"
    end
  end
end
