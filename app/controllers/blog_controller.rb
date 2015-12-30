require 'static_blog/article'

class BlogController < ApplicationController

  def index
    latest_articles
  end

  def show
    articles = Dir["#{Rails.root}/app/views/blog/_*"].
      map {|f| f.split("/")[-1].gsub(".html.erb","") }.
      map {|f| f[1..-1] }

    slug = params[:id].gsub("-","_")
    if articles.grep(/#{slug}/).any?
      @partial = slug
    else
      latest_articles
      render :index and return
    end
  end

private

  def latest_articles
    @articles ||= ARTICLES.sort {|a,b| b[:published_at] <=> a[:published_at] }
  end

end
