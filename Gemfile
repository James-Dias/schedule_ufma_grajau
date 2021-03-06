source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Bootstrap 4 Ruby Gem for Rails / Sprockets and Compass.
gem "bootstrap", ">= 4.3.1"
# A gem to automate using jQuery with Rails
gem 'jquery-rails'
# bootstrap-sass extras.
gem 'bootstrap-sass-extras'
# bootstrap glyphicons
gem 'bootstrap-glyphicons'
# A set of common locale data and translations to internationalize and/or localize your Rails applications.
gem 'rails-i18n', '~> 5.0', '>= 5.0.4'
# Flexible authentication solution for Rails with Warden.
gem 'devise'
# Devise Bootstrap views with i18n support.
gem 'devise-bootstrap-views'
# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps
gem 'kaminari'
# Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup.
gem 'simple_form'
# Minimal authorization through OO design and pure Ruby classes
gem 'pundit'
# PDF generator (from HTML) plugin for Ruby on Rails
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
# Draper adds an object-oriented layer of presentation logic to your Rails apps.
gem 'draper', '~> 3.0', '>= 3.0.1'
# CPF and CNPJ validations for ActiveModel and Rails
gem 'validates_cpf_cnpj'
# Validate, generate and format CPF/CNPJ numbers. Include command-line tools.
gem "cpf_cnpj"
# Filterrific is a Rails Engine plugin that makes it easy to filter, search, and sort your ActiveRecord lists.
gem 'filterrific'
# jQuery UI for the Rails asset pipeline
gem 'jquery-ui-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
