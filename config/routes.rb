Rails.application.routes.draw do
  match "/coding-bootcamp" => "web_page#what",
        via: :get, as: :coding_bootcamp_landing

  match "/coding-bootcamp"      => "web_page#what",   via: :get,  as: :what
  match "/coding-bootcamp/how"  => "web_page#how",    via: :get,   as: :how
  match "/coding-bootcamp/where"=> "web_page#where",  via: :get,   as: :where
  match "/coding-bootcamp/who"  => "web_page#who",    via: :get,   as: :who
  match "/coding-bootcamp/price"=> "web_page#price",  via: :get,   as: :price

  match "/coding-bootcamp/terms"=> "web_page#terms",  via: :get,   as: :terms

  match "/coding-bootcamp/apply"  => "web_page#apply",  via: :get,   as: :apply
  match "/coding-bootcamp/applied"=> "web_page#applied",via: :get,   as: :applied

  match "/partnerships/ngo-program"=> "web_page#ngo",  via: :get,   as: :ngo

  resources :blog, only: %i[index show]

  get "/sitemap", controller: :sitemap, action: :index

  match '/', :to => redirect('/coding-bootcamp'), via: :get
  match '/how', :to => redirect('/coding-bootcamp/how'), via: :get
  match '/where', :to => redirect('/coding-bootcamp/where'), via: :get
  match '/who', :to => redirect('/coding-bootcamp/who'), via: :get
  match '/price', :to => redirect('/coding-bootcamp/price'), via: :get
  match '/apply', :to => redirect('/coding-bootcamp/apply'), via: :get

  root to: "web_page#what"

end
