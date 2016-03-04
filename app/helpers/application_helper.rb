module ApplicationHelper

  def meta_title
    custom = content_for(:title)
    default = "Devschool | Become a Web Developer with guided instruction by an expert!"
    clean(custom || default)
  end

  def meta_description
    custom = content_for(:description)
    default = "Devschool is an online programming bootcamp for full stack web developers. Learn to become a full stack web developer in as little as 420 hours!"
    clean(custom || default)
  end

  def meta_keyword_tags
    return "" unless content_for(:keyword_tags)
    tags = content_for(:keyword_tags).split(",").map(&:strip)

    article_tags = tags.map do |kt|
      "<meta property=\"article:tag\" content=\"#{kt}\">"
    end

    news_keywords = "<meta name=\"news_keywords\" content=\"#{tags.join(", ")}\" />"

    raw [news_keywords, article_tags].join("\n")
  end

  def backend_url
    if Rails.env.development?
      "http://backend.devschool.dev:4000"
    else
      "https://backend.devschool.rocks"
    end
  end

  def clean(text)
    text.gsub("\n", " ").strip
  end

end
