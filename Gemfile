source 'https://rubygems.org'


gem 'rails', '~> 5.1.0'
gem 'rails-i18n'
gem 'mysql2'

gem 'sassc-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '>= 4.0.0'
gem 'therubyracer',  	platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks',  '~> 2.5.3'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',	group: :doc
gem 'font-awesome-sass', '~> 5.2.0'

gem 'jquery-ui-rails'

gem 'simple_form'
gem 'wobauth', '~> 3.4.4'
gem 'wobapphelpers', '~> 3.1'

# check_mk livestatus
# see http://mathias-kettner.de/checkmk_livestatus.html for more information
# on livestatus
gem 'livestatus', git: 'https://github.com/swobspace/livestatus.git',
                  branch: 'master'

# gem 'ottick', git: 'https://github.com/swobspace/ottick.git', branch: "master"
# gem 'ottrick', git: 'https://github.com/swobspace/ottrick.git', branch: "master"
gem 'cancancan'
gem 'figaro', '~> 1.0.0'

group :development do
  gem 'puma'
  gem 'spring'
  gem 'guard'
  gem "guard-livereload", require: false
  gem 'guard-rails'
  gem 'guard-bundler'
  gem "guard-rspec", require: false
  gem "capistrano", '~> 3.6'
  gem "capistrano-rails", '~> 1.1'
  gem 'capistrano-passenger'
  gem 'capistrano-yarn'
  gem "railroady"
  gem "better_errors"
  gem "binding_of_caller"
  gem "meta_request"
end

group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'dotenv'
end

group :test do
  gem "shoulda-matchers", require: false
  gem 'factory_bot_rails'
  gem 'database_rewinder'
  gem "capybara"
  gem "poltergeist"
end

gem 'record_tag_helper', '~> 1.0'
gem 'rails-controller-testing'

