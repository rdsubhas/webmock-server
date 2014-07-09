require 'webmock/server/api'

World(WebMock::Server::API)

Given /^I stub ([^ ]+) "(.+)"$/ do |method, url|
  @stub = stub_server_request(method.downcase.to_sym, url)
end
