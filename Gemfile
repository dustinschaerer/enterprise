source 'https://rubygems.org'

gem 'foreman'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'webpack-rails'
gem 'devise'
gem 'devise_invitable', '~> 1.7.0'
gem 'simple_form'
gem 'haml-rails', '~> 0.9'
gem 'font-awesome-rails'
gem 'capybara'
gem 'puppet_forge'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  platforms :mri do
    gem 'ruby-prof'
  end
  gem 'bundler-audit', require: false
  gem 'brakeman', require: false
  # http://ruby.sadi.st/Ruby_Sadist.html
  # gem 'flay'
  # gem 'heckle'
  # gem 'flog'
  # gem 'teaspoon'
  gem 'scss_lint', require: false
  gem 'rubocop', require: false
  gem 'parallel_tests'
  gem 'rails-controller-testing'
  # gem 'rails-perftest'
  gem 'minitest-spec-rails'
  gem 'simplecov', require: false
  gem 'rails_best_practices', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'pry'
  gem 'pry-rails'
  gem 'listen', '~> 3.0.5'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
