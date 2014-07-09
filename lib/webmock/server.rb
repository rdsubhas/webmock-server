require "webmock/server/version"

module WebMock
  module Server
    autoload :Handler, "webmock/server/handler"

    def self.start(port, base_url)
      require "rack"
      ::Rack::Handler::WEBrick.run Handler.new(base_url), Port: port
    end
  end
end
