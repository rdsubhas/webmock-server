require "webmock"
require "rack"

module WebMock
  module Server
    class Handler

      def call(env)
        uri = stub_uri
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
        request['CONTENT_TYPE'] = env['CONTENT_TYPE']

        begin
          response = Net::HTTP.new(uri.host, uri.port).request(request)
          headers = Hash[response.to_hash.map { |k,v| [k, v[0]] }]
          [ response.code, headers, [ response.body ]]
        rescue
          [ 599, {}, ['Unstubbed!'] ]
        end
      end

      private

      def stub_uri
        URI.parse STUB_URI
      end

    end
  end
end
