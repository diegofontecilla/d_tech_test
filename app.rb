require_relative './lib/driftrock_API'
require_relative './lib/data_processor'

class App

  def self.method_matcher(input_array)
    driftrock_API = DriftrockAPI.new
    purchases = driftrock_API.get_purchases
    users = driftrock_API.get_users
    return most_sold_item(purchases) if input_array[0] == 'most_sold_item'
    return most_loyal_user(purchases, users) if input_array[0] == 'most_loyal_user'
    return total_spend(purchases, users, input_array[1]) if input_array[0] == 'total_spend'
  end

  def self.most_sold_item(purchases)
    data_processor = DataProcessor.new(purchases)
    data_processor.most_founded_item
  end

  def self.total_spend(purchases, users, email)
    data_processor = DataProcessor.new(purchases, users)
    data_processor.get_total_spent(email)
  end

  def self.most_loyal_user(purchases, users)
    data_processor = DataProcessor.new(purchases, users)
    data_processor.most_loyal_user
  end
end

input_array = ARGV
app = App.method_matcher(input_array)
puts app
