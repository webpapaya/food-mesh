class Search
  include Mongoid::Document
  field :_id, type: String
  field :food_items, type: Array

  def self.search _query
    item = Search.find(_query)
    item
  end

  def self.add (_query, _item_list)
    i = Search.new(
        _id: _query,
        food_items: prepare_item_list(_item_list)
    )
    i.save
  end

  private
  def self.prepare_item_list _item_list
    list = []
    _item_list.each do |item|
      list << ({
          :api_key => item[:api_key],
          :item_id => item[:item_id]
      })
    end
    list
  end
end
