require "bundler/setup"
Bundler.setup

require 'webmock'
require 'webmock/server'
require 'httparty'

RSpec.configure do |config|
  config.include WebMock::Server::API

  config.before :suite do
    # Start the mock server
    Thread.new do
      WebMock::Server.start 3000
    end
    sleep 2
  end

  config.before :each do
    WebMock.reset!
    WebMock.allow_net_connect!
  end
end
