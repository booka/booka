
require 'yaml'
PUSHER = YAML.load_file(File.join(RAILS_ROOT, 'config', 'pusher.yml'))

Pusher.app_id = PUSHER['app_id']
Pusher.key = PUSHER['key']
Pusher.secret = PUSHER['secret']


