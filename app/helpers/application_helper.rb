module ApplicationHelper
  def meta_title
    custom = content_for(:title)
    default = "Devschool | Become a Web Developer with guided instruction by an expert!"
    custom || default
  end

  def meta_description
    custom = content_for(:description)
    default = "Devschool is an online programming bootcamp for full stack web developers. Learn to become a full stack web developer in as little as 420 hours!"
    custom || default
  end

  def backend_url
    if Rails.env.development?
      "http://backend.devschool.dev:4000"
    else
      "https://backend.devschool.rocks"
    end
  end
end
