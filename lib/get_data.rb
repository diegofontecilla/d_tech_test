require_relative 'driftrock_API'

class GetData
  attr_reader :api

  def initialize
    @api = DriftrockAPI.new
  end

  def most_frequent(query)
    hash = Hash.new(0)
    get_purchases.each { |p| hash[p[query]] += 1 }
    hash.sort_by { |query_item, count| count }.last.first
  end

  def total_spend
    user_id = get_users.find { |user| user['email'] == ARGV.last }['id']
    user_purchases = get_purchases.select { |purchase| purchase['user_id'] == user_id }
    total = 0
    user_purchases.map { |purchase| total += purchase['spend'].to_f }.last
    # user_purchases.sum { |purchase| purchase['spend'].to_f }
  end

  private

  def get_purchases
    api.purchases['data']
  end


  def get_users
    api.users['data']
  end
end
