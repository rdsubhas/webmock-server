$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')

require 'webmock/server'
require 'webmock/server/cucumber'

Thread.new do
  WebMock::Server.start 3000
end
sleep 2
