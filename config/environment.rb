RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem 'mislav-will_paginate', :version => '~> 2.3.8', :lib => 'will_paginate', :source => 'http://gems.github.com'
  config.gem 'paperclip', :version => '=2.1.2'
  config.gem 'sunspot', :lib => 'sunspot'
  config.gem 'sunspot_rails', :lib => 'sunspot/rails'
  #config.gem 'sunspot', :lib => 'sunspot', :version => '=1.0.5'
  #config.gem 'sunspot_rails', :lib => 'sunspot/rails', :version => '=1.0.5'
  #config.gem 'pdf-reader', :lib => 'pdf', :version => '0.7.7'
  config.time_zone = 'UTC'

end

