module ApplicationHelper
  def meta_title
    custom = content_for(:title)
    default = "Devschool | Become a Web Developer with guided instruction by an expert!"
    custom || default
  end

  def meta_description
    "Devschool is an online programming bootcamp for full stack web developers. Learn to become a full stack web developer in as little as 420 hours!"
  end

  def backend_url
    base = "https://backend.devschool.rocks"
    return base + ":4000" if Rails.env.production?
    base
  end
end
