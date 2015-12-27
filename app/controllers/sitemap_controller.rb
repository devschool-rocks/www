class SitemapController < ApplicationController
  respond_to :xml, :html

  def index
    respond_with(:index)
  end
end
