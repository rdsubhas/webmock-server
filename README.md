# Webmock::Server

[![Build Status](https://travis-ci.org/rdsubhas/webmock-server.svg?branch=master)](https://travis-ci.org/rdsubhas/webmock-server)

A fast, lightweight live stub server using WebMock and Rack!

[WebMock](https://github.com/bblimke/webmock) is a popular HTTP mocking library with great features. But it has one limitation: It mocks only at the language/framework/library level (e.g. it mocks Net::HTTP directly).

Sometimes, you may want to run a live server that can stub requests and responses. This gem bridges that gap. It starts a barebones Rack application which will delegate all requests to WebMock, so you get all the features of WebMock for stubbing, as well as a live server that can be controlled at runtime!

## Usage

* Add the gem to your Gemfile
* Start the stub server by saying `WebMock::Server.start <port>, <a stub url, e.g. http://stubme>`
* Use [WebMock](https://github.com/bblimke/webmock) to stub responses, like:

        WebMock::API.stub_request("http://stubme/").to_return(status: 200, body: 'test')

  * Note that we're using the same Stub URL that we specified earlier to `WebMock::Server.start`
  * You can use the full power of WebMock such as query parameter matching, request body matching, regular expression URLs and much more!

* See the `examples` folder for some partial list of examples. But remember: You can stub whatever WebMock can! So check the WebMock guide as well on how to stub.

See the `spec/examples` folder.

## Contributing

1. Fork it ( https://github.com/rdsubhas/webmock-server/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
