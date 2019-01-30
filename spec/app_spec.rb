require '../app'

describe App do

  purchases_json = File.read(File.join(File.dirname(__FILE__), 'purchases.json'))
  users_json = File.read(File.join(File.dirname(__FILE__), 'users.json'))
  purchases = JSON.parse(purchases_json)
  users = JSON.parse(users_json)
  let(:fake_purchases) { double(:purchases) }
  let(:fake_users) { double(:users) }


  subject(:app) { App.new(fake_purchases, fake_users) }

  it 'returns the #most_sold_item from the purchases' do
    # argv = double('ARGV', :first)
    # allow(argv).to receive(:to_sym)
    allow(fake_purchases).to receive(:most_sold_item)
    app.send(['most_sold_item'].first.to_sym)
    expect()
  end
end
