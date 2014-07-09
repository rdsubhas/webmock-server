require 'spec_helper'

describe 'POST' do
  it "root" do
    stub_server_request(:post, '/')
      .to_return(body: 'stub body', status: 201, headers: { 'x-custom-header' => 'stub header'})

    post '/'
    expect(last_response.status).to eq(201)
    expect(last_response.body).to eq('stub body')
    expect(last_response.headers['x-custom-header']).to eq('stub header')
  end

  it "path" do
    stub_server_request(:post, '/test')
      .to_return(body: 'stub body', status: 201, headers: { 'x-custom-header' => 'stub header'})

    post '/test'
    expect(last_response.status).to eq(201)
    expect(last_response.body).to eq('stub body')
    expect(last_response.headers['x-custom-header']).to eq('stub header')
  end

  it "query parameters" do
    stub_server_request(:post, '/test')
      .with(query: hash_including(x: 'y'))
      .to_return(body: 'stub body', status: 201, headers: { 'x-custom-header' => 'stub header'})

    post '/test?x=y'
    expect(last_response.status).to eq(201)
    expect(last_response.body).to eq('stub body')
    expect(last_response.headers['x-custom-header']).to eq('stub header')
  end

  it "request body" do
    stub_server_request(:post, '/test')
      .with(body: { x: 'y' })
      .to_return(body: 'stub body', status: 201, headers: { 'x-custom-header' => 'stub header'})

    post '/test', '{ "x" : "y" }', { 'CONTENT_TYPE' => 'application/json' }
    expect(last_response.status).to eq(201)
    expect(last_response.body).to eq('stub body')
    expect(last_response.headers['x-custom-header']).to eq('stub header')
  end
end
