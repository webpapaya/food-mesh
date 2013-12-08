require 'awesome_print'


require_dependency 'food_apis/fddb'
require_dependency 'food_apis/fsecret'
require_dependency 'food_apis/nutritionix_api'

module FoodApisModule
  @@apis = [NutritionixAPI.new, Fddb.new]

  ##
  # example return value for search
  #  [{
  #      "name"=>"Tilapia (Fish)",
  #      "amount"=>"Per 100g",
  #      "object_source_id" = 70157557973400
  #      "nutritions"=>{
  #          "Calories"=>"96kcal",
  #          "Fat"=>"1.70g",
  #          "Carbs"=>"0.00g",
  #          "Protein"=>"20.08g"
  #      }
  #  }]

  def search_apis query
    result = []
    @@apis.each do |api|
      result.concat(api.search query)
    end
    result
  end

  def get_item id
    @@apis.each do |api|
      api.get_item
    end
  end
end