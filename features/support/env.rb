$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')

require 'webmock'
require 'webmock/server'
require 'webmock/server/cucumber'
require 'lookout/rack/test/cucumber'

Lookout::Rack::Test.app = WebMock::Server::Handler
require 'lookout/rack/test/cucumber/server'

WebMock.allow_net_connect!
World(WebMock::Server::API)
