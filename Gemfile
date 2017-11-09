source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Ruby gem

#ruby '2.4.0'
# Boostrap gem
gem 'boostrap-sass'
# Semantic UI gem for cool front developers :P
gem 'less-rails-semantic_ui'
gem 'autoprefixer-rails'
gem 'therubyracer'
# jQuery gem
gem 'jquery-rails'

# will_paginate to paginate results
gem 'will_paginate', '~> 3.1', '>= 3.1.5'
# paginate results with semantic style (semantic rocks!)
gem "will_paginate_semantic_ui"

# PDF Builder
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
# Sprockets
gem 'sprockets'

# Carrierwave
gem 'carrierwave'

# Froala WYSIWYG HTML Editor
gem "wysiwyg-rails"
gem "font-awesome-rails"

# Devise
gem 'devise'
# Dotenv gem
gem 'dotenv-rails', groups: [:development, :test]
# Use Omniauth Facebook plugin
gem 'omniauth-facebook'#, '~> 4.0'
# Use Omniauth Github plugin
gem 'omniauth-github'#, '~> 1.1', '>= 1.1.2'
# Use Omniauth Google plugin
gem 'omniauth-google-oauth2'#, '~> 0.4.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
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

gem 'webpacker'

gem 'annotate', require: false
# Fakers
gem 'faker'
gem 'ui_faces'

gem 'chart'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'rspec-rails'
  gem "factory_girl_rails"

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
