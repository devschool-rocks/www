source 'https://rubygems.org'

ruby "2.2.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
gem 'rails_12factor', group: :production

# Use jquery as the JavaScript library
gem 'jquery-rails'

# for both digest and non
gem 'non-stupid-digest-assets'

gem "responders"

gem "font-awesome-rails"
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
#
group :production do
  gem 'puma'
end

group :development, :test do
  gem 'html-pipeline'
  gem 'pygments.rb'
  gem 'github-linguist'
  gem 'gemoji'
  gem 'github-markdown'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

