Rails.application.routes.draw do
  match "/coding-bootcamp" => "web_page#what",
        via: :get, as: :coding_bootcamp_landing

  match "/coding-bootcamp"      => "web_page#what",   via: :get,  as: :what
  match "/coding-bootcamp/who"  => "web_page#who",    via: :get,   as: :who
  match "/coding-bootcamp/price"=> "web_page#price",  via: :get,   as: :price

  match "/coding-bootcamp/terms"=> "web_page#terms",  via: :get,   as: :terms

  match "/coding-bootcamp/apply"  => "web_page#apply",  via: :get,   as: :apply
  match "/applied"=> "web_page#applied",via: :get,   as: :applied

  match "/partnerships/ngo-program"=> "web_page#ngo",  via: :get,   as: :ngo
  match "/partnerships/new-story"=> "web_page#new_story",  via: :get,   as: :new_story

  match "/gift-claimed"=> "web_page#gift_claimed",  via: :get,   as: :gift_claimed

  resources :free_gifts, only: %i[create]

  get "/sitemap", controller: :sitemap, action: :index

  match '/', :to => redirect('/coding-bootcamp'), via: :get
  match '/how', :to => redirect('/coding-bootcamp'), via: :get
  match '/coding-bootcamp/how', :to => redirect('/coding-bootcamp'), via: :get
  match '/where', :to => redirect('/coding-bootcamp'), via: :get
  match '/coding-bootcamp/where', :to => redirect('/coding-bootcamp'), via: :get
  match '/who', :to => redirect('/coding-bootcamp'), via: :get
  match '/price', :to => redirect('/coding-bootcamp/price'), via: :get
  match '/apply', :to => redirect('/coding-bootcamp/apply'), via: :get

  match '/:keyword/promotions/:code' => "promotions#show", via: :get

  root to: "web_page#what"

  dead_urls = ["/affiliates","/what",
               "/posts/online-dev-school-br-frequently-asked-questions",
               "/posts/intro-to-javascript-build-a-deck-of-cards-the-card-object",
               "/posts/announcing-our-web-developer-apprenticeship-program",
               "/categories", "/posts", "terms", '/blog']


  dead_urls.each do |url|
    match url, :to => redirect('/coding-bootcamp'), via: :get
  end

  match "/ngo-program", :to => redirect('/partnerships/ngo-program'), via: :get
end
