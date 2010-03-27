# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_booka_session',
  :secret      => '391a4696fd52a408e89252244b625a9933eef81fe761bbe7d7b11af52e1ebbe3bcc188c558bd9b4cc11e593db41f22fe6675764162623b6876319bbefc34ccbc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
