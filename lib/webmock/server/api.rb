module WebMock
  module Server
    module API

      def stub_server_request(method, uri)
        WebMock::API.stub_request(method, stubbed_uri(uri))
      end

      def a_server_request(method, uri)
        WebMock::API.a_request(method, stubbed_uri(uri))
      end

      private

      def stubbed_uri(uri)
        if uri.is_a? String
          stub_uri + uri
        elsif uri.is_a? Regexp
          Regexp.new stub_uri + uri.source
        elsif uri.is_a? Addressable::Template
          Addressable::Template.new stub_uri + uri.pattern
        end
      end

      def stub_uri
        STUB_URI
      end

    end
  end
end
