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
  config.gem "pusher"
  
  config.time_zone = 'UTC'
  config.load_paths << "#{RAILS_ROOT}/lib"

  if RAILS_ENV == "development" && false
    puts "Setup request logger."
    config.middleware.use "RequestLogger"
  end

  config.action_controller.resources_path_names = { :new => 'nuevo', :edit => 'cambiar' }
  config.action_controller.page_cache_directory = RAILS_ROOT + "/public/cache/"

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = :es
end



ExceptionNotification::Notifier.exception_recipients = %w(danigb@gmail.com)
ExceptionNotification::Notifier.sender_address = %("Booka Application Error" <errors@plataformabooka.net>)
ExceptionNotification::Notifier.email_prefix = "[booka] "