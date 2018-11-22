require_relative './lib/purchases'
require_relative './lib/users'

class App
  attr_reader :purchases, :users

  def initialize(purchases, users)
    @purchases = purchases
    @users = users
  end

  def most_sold_item
    purchases.most_sold_item
  end

  def most_loyal_user
    users.most_loyal_user
  end

  def total_spend
    users.get_total_spend
  end
end

app = App.new(Purchases.new, Users.new)
puts app.send(ARGV.first.to_sym)
