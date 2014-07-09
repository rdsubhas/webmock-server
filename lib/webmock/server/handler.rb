require "webmock"
require "rack"

module WebMock
  module Server
    class Handler

      attr_reader :url

      def initialize(url)
        @url = url
      end

      def call(env)
        uri = URI.parse @url
        uri.path = env['PATH_INFO']
        uri.query = env['QUERY_STRING']

        request = case env['REQUEST_METHOD']
          when 'GET'
            Net::HTTP::Get.new uri
          when 'POST'
            Net::HTTP::Post.new uri
          else
            nil
        end
        request.body = env['rack.input'].gets if env['rack.input']

        response = Net::HTTP.new(uri.host, uri.port).request(request)

        headers = Hash[response.to_hash.map { |k,v| [k, v[0]] }]
        [ response.code, headers, [ response.body ]]
      end

    end
  end
end
