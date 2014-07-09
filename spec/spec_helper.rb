require "bundler/setup"
Bundler.setup

require 'webmock'
require 'webmock/server'
require 'rack/test'

RSpec.configure do |config|
  config.include WebMock::Server::API
  config.include Rack::Test::Methods

  config.before :each do
    WebMock.allow_net_connect!
    WebMock.reset!
  end

  def app
    WebMock::Server::Handler.new
  end
end
