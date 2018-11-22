require_relative 'get_data'

class Users < GetData

  def most_loyal_user
    user_id = most_frequent('user_id')
    get_users.find { |user| user['id'] == user_id }['email']
  end

  def get_total_spend
    total_spend
  end
end
