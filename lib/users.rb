require_relative 'get_data'

class Users < GetData

  def most_loyal_user
    user_id = most_frequent('user_id')
    get_users.find { |user| user['id'] == user_id }['email']
  end

  def total_spend
    user_id = get_users.find { |user| user['email'] == ARGV.last }['id']
    user_purchases = get_purchases.select { |purchase| purchase['user_id'] == user_id }
    total = 0
    user_purchases.map { |purchase| total += purchase['spend'].to_f }.last
    # user_purchases.sum { |purchase| purchase['spend'].to_f }
  end
end
