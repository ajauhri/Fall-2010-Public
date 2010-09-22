# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_PET_session',
  :secret      => '1f4d174a6cc4d639ab979a0e7a91c77226e7124862446a9c3bdee8d93fa66ef2433c99ab9715a1b60f77174ce6cc4a9a79e11a258306ec012b480aad1cbeb8dd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
