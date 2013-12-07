class Fsecret
  def initialize
    FatSecret.init('e2310b092c9f4acbb43657f59c242245', '3d0cc9b6114741bbbfe6c2510e8913c3')
  end

  def search query
    parse_data(FatSecret.search_food(query)).to_s
  end

  ##
  # todo calculate nutritions per 100g
  #

  private
  def parse_data data
    parsed_data = []
    data["foods"]["food"].each do |item|
      tmp = item["food_description"].split(" - ")
      desc = tmp[1]


      food = Hash.new
      food["name"] = item["food_name"]
      food ["amount"] = tmp[0]
      food["nutritions"] = Hash.new

      ingredients = desc.split(" | ")
      ingredients.each do |ingredient|
        tmp = ingredient.split(": ")
        food["nutritions"][tmp[0]] = tmp[1]
      end
      parsed_data.push(food)
    end

    parsed_data.to_s
  end

end