require 'food_apis_module'

class FoodOverviewsController < ApplicationController
  respond_to :js

  include FoodApisModule #include all functions from foodAPIs Module

  def index
    @results = search_apis params[:query]
    get_the_linechart
  end

  def show
    api_id = params[:api_id].to_i
    food_id = params[:food_id]
    @results = get_item(api_id, food_id)

    pie_chart_instance = PieChart.new @results[:nutritions]
    @pie_chart = pie_chart_instance.get_pie_chart
  end

  def food_data
    @results.each do |h|
      @name = h[:name];
      @kcal = (h[:nutritions]["kcal"])
      logger.debug("fat"); logger.debug(h[:nutritions]["fat"])
      logger.debug("kj"); logger.debug( h[:nutritions]["kj"])
      return @kcal # tried to access kcal of products in line_chart.rb
    end
  end

  def get_the_linechart

    line_chart_instance = LineChart.create(food_data)
    logger.debug("food_data");logger.debug(line_chart_instance)
    @line_chart = line_chart_instance.get_line_chart
    render :json => @line_chart
    ap @line_chart
  end

  def redirect_to_index
    redirect_to :controller => 'food_overviews', :action => 'index', :query => params[:query]
  end
end
