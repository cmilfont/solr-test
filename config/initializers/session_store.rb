# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_solr-test_session',
  :secret      => '98a6126786bf29c182f31c4cb4861f9da1961e075f6d4ec1664893ffaffd1247a98efd03291d22081b73f65f5920e3f70f7fc564915273e3c71f0e87dc6f3c58'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
