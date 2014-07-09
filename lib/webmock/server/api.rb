module WebMock
  module Server
    module API

      def stub_request(method, url)
        WebMock::API.stub_request(method, stubbed_url(url))
      end

      def reset!
        WebMock.reset!
      end

      private

      def stubbed_url(url)
        if url.is_a? String
          stub_url + url
        elsif url.is_a? Regexp
          Regexp.new stub_url + url.source
        elsif url.is_a? Addressable::Template
          Addressable::Template.new stub_url + url.pattern
        end
      end

      def stub_url
        "http://stubme"
      end

    end
  end
end
