require 'static_blog/article'

class BlogController < ApplicationController

  def index
    @articles = ARTICLES
  end

  def show
    articles = Dir["#{Rails.root}/app/views/blog/_*"].
      map {|f| f.split("/")[-1].gsub(".html.erb","") }.
      map {|f| f[1..-1] }

    if articles.grep(/params[:id]/).any?
      @partial = params[:id].gsub("-","_")
    else
      @articles = ARTICLES
      render :index and return
    end
  end

end
