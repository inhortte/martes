# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_martes_session',
  :secret      => '63c4bb930cdf03bb06f2690180c60dd08a6e21fe1b7b1b299ea4bb7da0246915f41710845f4ab15b267ad1c057830a99d38a79c6b1ad3dd10ec8fb5e850937a9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
