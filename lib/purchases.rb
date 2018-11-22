require_relative 'get_data'

class Purchases < GetData

  def most_sold_item
    most_frequent('item')
  end
end
