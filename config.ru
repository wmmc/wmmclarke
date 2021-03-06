# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

# use Rack::Rewrite do
#   rewrite   '/blog',  '/blog/'
# end

# use Rack::ReverseProxy do
#   # reverse_proxy(/^\/blog(\/?.*)$/, 'http://wmmc.github.io/blog$1')
#   # reverse_proxy(/^\/blog(\/?.*)$/, 'http://54.72.249.164/blog$1')
# end

use Rack::ReverseProxy do
  reverse_proxy_options preserve_host: true
  reverse_proxy(/^\/blog(\/?.*)$/, 'http://wmmc.github.io/blog$1')
end

use Rack::CanonicalHost, ENV['CANONICAL_HOST'] if ENV['CANONICAL_HOST']

run Rails.application
