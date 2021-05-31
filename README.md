# README

This is a simple guide for MANUAL INSTALLATION of a new Ruby on Rails app.

App versions:

* Ruby version 2.7.0 https://www.ruby-lang.org/en/documentation/installation/
  ```
  rvm list
  rvm gemset use 2.7.0@covid-data-app --create
  ```

* Rails version 6.1.3 https://guides.rubyonrails.org/getting_started.html
  ```
  gem install rails -v 6.1.3
  ```

* Node v14.15.3 https://github.com/hokaccha/nodebrew
  ```
  curl -L git.io/nodebrew | perl - setup
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  nodebrew install v14.15.3
  ```

App Gems:

* pg https://rubygems.org/gems/pg/versions/0.18.4
  ```
  gem 'pg'
  ```

* Rubocop https://github.com/rubocop/rubocop
  ```
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-performance', require: false
  ```

* Rails Best Practice https://github.com/flyerhzm/rails_best_practices
  ```
  gem 'rails_best_practices', require: false
  ```

* Guard https://github.com/guard/guard
  ```
  gem 'guard', require: false
  gem 'guard-rails_best_practices', git: 'https://github.com/logankoester/guard-rails_best_practices.git'
  gem 'guard-rubocop', require: false
  ```

* RSpec https://github.com/rspec/rspec-rails
  ```
  gem 'rspec-rails'
  ```

* Factory Bot https://github.com/thoughtbot/factory_bot_rails
  ```
  gem 'factory_bot_rails'
  ```

* Faker https://github.com/faker-ruby/faker
  ```
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  ```
