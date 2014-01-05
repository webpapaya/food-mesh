require 'food_apis_module'

class FoodItemController < ApplicationController
  before_filter :before_actions
  include FoodApisModule

  def show
    @food_item = SearchLocalRemote.get_single_item params[:item_id]
    pie_chart_instance = PieChart.new @food_item[:nutritions]
    @pie_chart = pie_chart_instance.get_pie_chart
  end

  def search
    translation_en = @translator.translate params[:query]
    food_items = @local_remote.search translation_en
    @food_items = food_items[:items]
    @name_translation = food_items[:translations]
  end

  def compare
    @food_items = user_session.get_user_items
    @chart = LineChart.get_chart @food_items if @food_items.class == Array
  end

  def redirect_to_index
    set_current_locale
    redirect_to search_db_path params[:query]
  end

  def clear_search_cache
    if logged_in?
      Search.clear_cache
    end
    redirect_to dashboard_path, :notice => 'Cleared search cache'
  end

  private
  def before_actions
    @translator = Translations.new params[:locale]
    @local_remote = SearchLocalRemote.new
  end
end
