require 'rubygems'
require 'httparty'

class DriftrockAPI
  def initialize(base_url = "driftrock-dev-test.herokuapp.com")
    @base_url = base_url
  end

  def purchases
    get('purchases')
  end

  def users
    get('users')
  end

  private

  def get(path)
    HTTParty.get("http://#{@base_url}/#{path}")
  end
end
