class SitemapController < ApplicationController
  respond_to :xml

  def index
    respond_with(:index)
  end
end
