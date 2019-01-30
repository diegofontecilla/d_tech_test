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

  private

  def get_purchases
    api.purchases['data']
  end


  def get_users
    api.users['data']
  end
end
