require 'driftrock_API'
require 'webmock'
require 'httparty'

describe DriftrockAPI do

  subject(:driftrock_API) { DriftrockAPI.new }

  it '#get_purchases returns a hash' do
    stub_request(:get, "http://driftrock-dev-test.herokuapp.com/purchases").
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'})
    .to_return(:status => 200, :body => "{ 'id': '1' }", :headers => {})
    stub_request(:get, "https://driftrock-dev-test.herokuapp.com/purchases")
    respond = driftrock_API.get_purchases.body
    expect(respond).to eq "{ 'id': '1' }"
  end

  it '#get_users returns a hash' do
    stub_request(:get, "http://driftrock-dev-test.herokuapp.com/users").
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'})
    .to_return(:status => 200, :body => "{ 'id': '1' }", :headers => {})
    stub_request(:get, "https://driftrock-dev-test.herokuapp.com/purchases")
    respond = driftrock_API.get_users.body
    expect(respond).to eq "{ 'id': '1' }"
  end
end
