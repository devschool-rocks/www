Rails.application.routes.draw do
  match "/coding-bootcamp"      => "web_page#home",   via: :get,  as: :home
  match "/coding-bootcamp/terms"=> "web_page#terms",  via: :get,   as: :terms
  match "/partnerships/new-story"=> "web_page#new_story",  via: :get,   as: :new_story
  match "/gift-claimed"=> "web_page#gift_claimed",  via: :get,   as: :gift_claimed

  resources :free_gifts, only: %i[create]

  get "/sitemap", controller: :sitemap, action: :index

  match '/', :to => redirect('/coding-bootcamp'), via: :get

  match '/:keyword/promotions/:code' => "promotions#show", via: :get

  root to: "web_page#home"

  dead_urls = ["/affiliates","/what", "/how", "/where", "/who", "/apply",
               "/posts/online-dev-school-br-frequently-asked-questions",
               "/posts/intro-to-javascript-build-a-deck-of-cards-the-card-object",
               "/posts/announcing-our-web-developer-apprenticeship-program",
               "/categories", "/posts", "terms", '/blog', "/coding-bootcamp/how",
               "/partnerships/ngo-program", "/coding-bootcamp/who", "pricing",
               "/coding-bootcamp/pricing"]


  dead_urls.each do |url|
    match url, :to => redirect('/coding-bootcamp'), via: :get
  end

  match "/ngo-program", :to => redirect('/partnerships/ngo-program'), via: :get
end
