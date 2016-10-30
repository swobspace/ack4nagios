source 'https://rubygems.org'


gem 'rails', '~> 4.2.7'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '>= 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  	platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks',  '~> 2.5.3'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',	group: :doc

gem "bower-rails", "~> 0.11.0"
gem 'jquery-ui-rails'

gem 'simple_form'
gem 'wobauth', git: 'https://github.com/swobspace/wobauth.git', branch: '1-0-stable'
gem 'wobapphelpers', git: 'https://github.com/swobspace/wobapphelpers.git',
                     branch: '1-0-stable'

# check_mk livestatus
# see http://mathias-kettner.de/checkmk_livestatus.html for more information
# on livestatus
gem 'livestatus', git: 'https://github.com/swobspace/livestatus.git',
                  branch: 'master'

gem 'ottick', git: 'https://github.com/swobspace/ottick.git', branch: "master"
gem 'ottrick', git: 'https://github.com/swobspace/ottrick.git', branch: "master"
gem 'cancancan'
gem 'figaro', '~> 1.0.0.rc1'

group :development do
  gem 'puma'
  gem 'spring'
  gem 'guard'
  gem "guard-livereload", require: false
  gem 'guard-rails'
  gem 'guard-bundler'
  gem "guard-rspec", require: false
  gem "capistrano", '~> 3.6'
  gem "capistrano-rails", '~> 1.1.1'
  gem 'capistrano-passenger'
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
  gem "shoulda", require: false
  gem 'factory_girl_rails'
  gem 'database_rewinder'
  gem "capybara"
  gem "poltergeist"
end

group :production do
  gem 'mysql2'
end
