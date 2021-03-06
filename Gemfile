source 'https://rubygems.org'
ruby '2.1.0'

gem 'rails', '4.0.0'

# Assets
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass', '>= 3.0.0.0'

# Authentication & roles
gem 'cancan'
gem 'devise'
gem 'rolify'

gem 'simple_form'
gem 'jbuilder', '~> 1.2'
gem 'figaro'
gem 'unicorn'
gem 'rack-timeout'

gem 'rails_admin', git: 'https://github.com/sferik/rails_admin.git'

gem 'newrelic_rpm'

gem 'acts-as-taggable-on'
gem 'friendly_id', '~> 5.0.0'

group :production do
  gem 'pg'
  gem 'rails_12factor' # Logging and assets with Heroku
end

group :development, :test do
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'faker'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'bullet'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
end
