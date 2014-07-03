source 'https://rubygems.org'


gem 'rails', '~> 4.1.0'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  	platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',	group: :doc
gem 'spring',        	group: :development
gem 'thin'

gem 'bootstrap-sass', '~> 3.1.1'
gem 'jquery-ui-rails'
gem 'jquery-datatables-rails'

gem 'simple_form', git: 'https://github.com/plataformatec/simple_form.git',
		   branch: 'master'

# check_mk livestatus
# see http://mathias-kettner.de/checkmk_livestatus.html for more information
# on livestatus
gem 'livestatus', git: 'https://github.com/swobspace/livestatus.git',
                  branch: 'master'

gem 'wobauth', git: 'git@github.com:swobspace/wobauth.git', branch: 'master'
gem 'wobapphelpers', git: 'https://github.com/swobspace/wobapphelpers.git',
                     branch: "master"

gem 'ottick', git: 'https://github.com/swobspace/ottick.git', branch: "master"
gem 'ottrick', git: 'https://github.com/swobspace/ottrick.git', branch: "master"
gem 'cancancan', '~> 1.8.0'

group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'guard-rspec'
  gem "guard-livereload", require: false
  gem 'guard-rails'
end

group :test do
  gem 'factory_girl_rails'
end

group :production do
  gem 'mysql2'
end
