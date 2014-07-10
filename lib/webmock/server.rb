require "webmock/server/version"

module WebMock
  module Server
    STUB_URI = 'http://localhost:65534'

    autoload :Handler, "webmock/server/handler"
    autoload :API, "webmock/server/api"
    autoload :Cucumber, "webmock/server/cucumber"

    def self.start(options={})
      require "rack"
      ::Rack::Handler::WEBrick.run Handler.new, options
    end
  end
end
