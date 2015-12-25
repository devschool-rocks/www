Rails.application.routes.draw do
  match "/" =>    "web_page#what",   via: :get,   as: :what
  match "how"  => "web_page#how",    via: :get,   as: :how
  match "where"=> "web_page#where",  via: :get,   as: :where
  match "who"  => "web_page#who",    via: :get,   as: :who
  match "price"=> "web_page#price",  via: :get,   as: :price

  match "terms"=> "web_page#terms",  via: :get,   as: :terms

  match "apply"  => "web_page#apply",  via: :get,   as: :apply
  match "applied"=> "web_page#applied",via: :get,   as: :applied

  match "ngo-program"=> "web_page#ngo",  via: :get,   as: :ngo

  get "/sitemap", controller: :sitemap, action: :index

  root to: "web_page#what"

end
