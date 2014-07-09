require 'spec_helper'

describe 'GET' do
  it "root" do
    stub_request(:get, 'http://stubme/')
      .to_return(body: 'stub body', status: 201, headers: { 'x-custom-header' => 'stub header'})

    response = HTTParty.get 'http://localhost:3000/'
    expect(response.code).to eq(201)
    expect(response.body).to eq('stub body')
    expect(response.headers['x-custom-header']).to eq('stub header')
  end

  it "path" do
    stub_request(:get, 'http://stubme/test')
      .to_return(body: 'stub body', status: 201, headers: { 'x-custom-header' => 'stub header'})

    response = HTTParty.get 'http://localhost:3000/test'
    expect(response.code).to eq(201)
    expect(response.body).to eq('stub body')
    expect(response.headers['x-custom-header']).to eq('stub header')
  end

  it "query parameters" do
    stub_request(:get, 'http://stubme/test')
      .with(query: hash_including(x: 'y'))
      .to_return(body: 'stub body', status: 201, headers: { 'x-custom-header' => 'stub header'})

    response = HTTParty.get 'http://localhost:3000/test?x=y'
    expect(response.code).to eq(201)
    expect(response.body).to eq('stub body')
    expect(response.headers['x-custom-header']).to eq('stub header')
  end
end
