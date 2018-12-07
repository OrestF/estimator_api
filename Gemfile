source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

# Auth
gem 'devise', '~> 4.5.0'
gem 'devise-jwt', '~> 0.5.8'
gem 'devise_invitable', '~> 1.7.5'
gem 'pundit', '~> 2.0'

# JSON
gem 'blueprinter', '0.8.0'
gem 'oj', '3.7.1'

gem 'api-pagination'
gem 'pagy'

gem 'searchkick', '~> 3.1', '>= 3.1.2'

# AMQP
gem 'bunny', '~> 2.9', '>= 2.9.2'
gem 'sneakers', '~> 2.7'

gem 'redis', '~> 4.0', '>= 4.0.3'
gem 'sidekiq', '~> 5.2', '>= 5.2.3'

# Boot
gem 'bootsnap', '>= 1.1.0', require: false
gem 'foreman', '~> 0.85.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'apitome', '0.2.0'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'bunny-mock', '~> 1.7'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'faker', '1.8.7'
  gem 'rspec_api_documentation', '6.1.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', '~> 0.60.0', require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner', '~> 1.7'
  gem 'json_spec', '1.1.5'
  gem 'rails-controller-testing', '1.0.2'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
