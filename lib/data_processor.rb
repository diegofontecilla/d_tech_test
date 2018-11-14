require 'json'

class DataProcessor

  def initialize(purchases, users = nil)
    @purchases = purchases
    @users = users
  end

  def most_founded_item
    most_founded = []
    count_elements.each {|id, number| most_founded << number}
    count_elements.key(most_founded.max)
  end

  def most_loyal_user
    users_array = @users['data']
    users_array.map do |user|
      return user['email'] if user['id'] == most_founded_item
    end
  end

  def get_total_spent(email)
    id = find_id(email)
    spent = 0
    @purchases['data'].each do |purchase|
      spent += purchase['spend'].to_f if purchase['user_id'] == id
    end
    spent
  end

  private

  def find_id(email)
    users_array = @users['data']
    users_array.map do |user|
      return user['id'] if user['email'] == email
    end
  end

  def get_elements
    elements_array = []
    @users == nil ? key = 'item' : key = 'user_id'
    @purchases['data'].each {|purchase| elements_array << purchase[key]}
    elements_array
  end

  def count_elements
    elements_array = get_elements
    elements_counted = {}
    elements_array.uniq.each {|id| elements_counted[id] = elements_array.count(id)}
    elements_counted
  end
end
