require 'static_blog/article'

class BlogController < ApplicationController

  def index
    @articles = ARTICLES
  end

end
