
ActiveRecord::Base.logger = Logger.new(STDOUT)

config.gem "factory_girl" #, :lib  => "factory_girl", :source => 'http://gemcutter.org'
config.gem "shoulda" #, :lib => "shoulda", :source => 'http://gemcutter.org'

config.cache_classes = true

config.whiny_nils = true

config.action_view.cache_template_loading            = true

config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false
config.action_controller.allow_forgery_protection    = false

config.action_mailer.delivery_method = :test

