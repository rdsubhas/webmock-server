require 'spec_helper'

describe 'POST' do
  it "root" do
    stub_request(:post, '/')
      .to_return(body: 'stub body', status: 201, headers: { 'x-custom-header' => 'stub header'})

    response = HTTParty.post 'http://localhost:3000/'
    expect(response.code).to eq(201)
    expect(response.body).to eq('stub body')
    expect(response.headers['x-custom-header']).to eq('stub header')
  end

  it "path" do
    stub_request(:post, '/test')
      .to_return(body: 'stub body', status: 201, headers: { 'x-custom-header' => 'stub header'})

    response = HTTParty.post 'http://localhost:3000/test'
    expect(response.code).to eq(201)
    expect(response.body).to eq('stub body')
    expect(response.headers['x-custom-header']).to eq('stub header')
  end

  it "query parameters" do
    stub_request(:post, '/test')
      .with(query: hash_including(x: 'y'))
      .to_return(body: 'stub body', status: 201, headers: { 'x-custom-header' => 'stub header'})

    response = HTTParty.post 'http://localhost:3000/test?x=y'
    expect(response.code).to eq(201)
    expect(response.body).to eq('stub body')
    expect(response.headers['x-custom-header']).to eq('stub header')
  end

  it "request body" do
    stub_request(:post, '/test')
      .with(body: { x: 'y' })
      .to_return(body: 'stub body', status: 201, headers: { 'x-custom-header' => 'stub header'})

    response = HTTParty.post 'http://localhost:3000/test', body: { x: 'y' }
    expect(response.code).to eq(201)
    expect(response.body).to eq('stub body')
    expect(response.headers['x-custom-header']).to eq('stub header')
  end
end
