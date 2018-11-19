require 'data_processor'
require 'json'
require 'pathname'

describe DataProcessor do

  purchases_json = File.read(File.join(File.dirname(__FILE__), 'purchases.json'))
  purchases = JSON.parse(purchases_json)
  users_json = File.read(File.join(File.dirname(__FILE__), 'users.json'))
  users = JSON.parse(users_json)

  it '#most_founded_item returns the repeated item in a json object' do
    data_processor = DataProcessor.new(purchases)
    expect(data_processor.most_founded_item).to eq("Heavy Duty Concrete Watch")
  end
  #
  it '#most_loyal_user returns the email of the users that has bought more items' do
    data_processor = DataProcessor.new(purchases, users)
    expect(data_processor.most_loyal_user).to eq("travis_kshlerin@wunsch.net")
  end

  it '#get_total_spent get an email as argument and returns the amount that user has spent' do
    data_processor = DataProcessor.new(purchases, users)
    expect(data_processor.get_total_spent('travis_kshlerin@wunsch.net')).to eq(336.76)
  end
end
