require "webmock/server/version"

module WebMock
  module Server
    STUB_URI = 'http://stubme'

    autoload :Handler, "webmock/server/handler"
    autoload :API, "webmock/server/api"

    def self.start(port)
      require "rack"
      ::Rack::Handler::WEBrick.run Handler.new, Port: port
    end
  end
end
