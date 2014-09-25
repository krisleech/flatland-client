require 'json'
require 'flatland/client'

describe 'Flatland::Client' do
  it 'sends build details to endpoint' do

    Flatland::Client.time('script/ci')

    expected_json = {
      duration: '100'
    }.to_json

    stub = stub_request(:post, "www.example.com")

    expect(stub).to have_been_requested
  end
end
