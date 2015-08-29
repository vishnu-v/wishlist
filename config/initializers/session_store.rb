# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wishlist_session',
  :secret      => '018c1bab916a8ca4b8e59c0153063aab40566cfe38cf884a0c1296cf6e8574a1f9863603b0246d5eef5a3629d841b5343debbdf8bcaf842500915299c426d2df'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
