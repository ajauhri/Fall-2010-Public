# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_spec_session',
  :secret      => '1c557025a4e12fd0a5deca880876f000ef6315716f6940195d89ef1004fbf11c8a4f442a19097ba08b9807f0bb7b0d60300fdcd517e1c3e82a3eda7d9aec92d9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
