require 'json'
require 'flatland/client'

describe 'Flatland::Client' do
  let(:client) { Flatland::Client.new }

  it 'sends build details to endpoint' do

    expected_body    = { duration: 1 }
    expected_headers = { 'Content-Type' => 'application/json' }

    stub_request(:post, "http://example.com/builds").
       with(body: expected_body, headers: expected_headers).
       to_return(status: 200)

    client.do('sleep 1')
  end
end
