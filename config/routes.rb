Rails.application.routes.draw do
  match "what" => "web_page#what",   via: :get,   as: :what
  match "how"  => "web_page#how",    via: :get,   as: :how
  match "where"=> "web_page#where",  via: :get,   as: :where
  match "who"  => "web_page#who",    via: :get,   as: :who
  match "price"=> "web_page#price",  via: :get,   as: :price

  root to: "web_page#what"

end
