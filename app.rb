require_relative './lib/driftrock_API'
require_relative './lib/data_processor'

class App
  def initialize(api = DriftrockAPI.new)
    @api = api
  end

  def most_sold_item
    most_frequent('item')
  end

  def most_loyal_user
    user_id = most_frequent('user_id')
    users.find { |user| user['id'] == user_id }['email']
  end

  def total_spend
    user_id = users.find { |user| user['email'] == ARGV.last }['id']
    user_purchases = purchases.select { |purchase| purchase['user_id'] == user_id }
    total = 0
    user_purchases.map { |purchase| total += purchase['spend'].to_f }.last
  end

  private

  def most_frequent(query)
    hash = Hash.new(0)
    purchases.each { |p| hash[p[query]] += 1 }
    hash.sort_by { |query_item, count| count }.last.first
  end

  def purchases
    @api.purchases['data']
  end

  def users
    @api.users['data']
  end
end

app = App.new
puts app.send(ARGV.first.to_sym)
