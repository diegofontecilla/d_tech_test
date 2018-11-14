require 'rubygems'
require 'httparty'

class DriftrockAPI
  include HTTParty
  base_uri("driftrock-dev-test.herokuapp.com")

  def get_purchases
    purchases
  end

  def get_users
    users
  end

  private

  def users
    self.class.get('/users')
  end

  def purchases
    self.class.get('/purchases')
  end
end
