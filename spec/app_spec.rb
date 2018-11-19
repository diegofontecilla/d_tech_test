require 'app'
require 'json'

describe App do

  purchases_json = File.read('purchases.json')
  parsed_purchases = JSON.parse(purchases_json)
  let(:api) { double(:driftrock_API, :purchases => pursed_purchases) }
  subject(:app) { App.new(driftrock_API) }

  it '#most_sold_item returns the item that has been sold more times' do
    p api.purchases
    expect(app.most_sold_item).to eq("Heavy Duty Concrete Watch")
  end
end
