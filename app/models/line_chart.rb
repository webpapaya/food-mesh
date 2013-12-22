require_dependency 'food_apis_module'

class LineChart < ActiveRecord::Base

  def initialize
    @window_width = 1000
    @window_height = 500
  end

  def get_line_chart
    {
      :values => get_values
    }
  end


  def get_values
    @values = {
        "fat" => 100,
        "calories" => 200,
        "protein" => 490,
        "calcium" => 300,
        "sugar" => 310,
        "water" => 390,
        "alcohol" => 250,
        "vitamin_c" => 300,
        "vitamin_a" => 290,
        "iron" => 300,
    }

  end

  def get_db_values
    #@start_x = 0
    #@start_y = 900


    [{
         "name"=>"Tilapia (Fish)",
         "amount"=>"Per 100g",
         "object_source_id" => 70157557973400,   # no comma and arrow
         "nutritions"=>{
             "Calories"=>"96kcal",
             "Fat"=>"1.70g",
             "Carbs"=>"0.00g",
             "Protein"=>"20.08g"
         }
     }]

    #logger.debug("FoodApisModule")
    #logger.debug(FoodApisModule.@@apis())
    #get_item()

    @path = "M 0 #{@window_height}"
    i = 0

    @values.each do |key, value|
      @path << " L #{i*100}  #{value}"
      i+=1
    end

    @path << "L #{@window_width} #{@window_height} Z"

    @debug = @path
  end
end
