ruby '3.1.4'
source 'https://rubygems.org'

gem 'http'
gem 'pg'
gem 'puma'
gem 'rails', '~> 6.1'
gem 'rack-cors', :require => 'rack/cors'

group :development, :test do
  gem 'listen'
end

# https://stackoverflow.com/a/70500221
group :production do
  gem 'net-smtp', require: false
  gem 'net-imap', require: false
  gem 'net-pop', require: false
end
