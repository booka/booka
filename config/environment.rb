# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "newrelic_rpm"
  config.gem 'inherited_resources', :source => 'http://gemcutter.org', :version => '1.0.3'
  config.gem 'formtastic'
  config.gem 'searchlogic'
  config.gem 'authlogic'
  config.gem 'ancestry'
  config.gem 'cancan'
  #config.gem 'translator', :source => 'http://gems.github.com'
  config.time_zone = 'UTC'

  if RAILS_ENV == "development"
    puts "Setup request logger."
    config.middleware.use "RequestLogger"
  end

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = :es
end