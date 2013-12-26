##
# university:  University of Applied Sciences Salzburg
# studie:      MultiMediaTechnology
# usage:	     Multimediaprojekt 2a (MMP2a)
# @author:     - Thomas Mayrhofer (thomas@mayrhofer.at)

require 'awesome_print'
class UserSessionController < ApplicationController
  def change_user_settings
    user_session.change_user_settings params

    respond_to do |format|
      format.html { redirect_to :back}
      format.js
    end
  end

  def delete_all_items
    user_session.delete_all_items
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render 'user_session/add_items_to_basket' }
    end
  end

  def add_items_to_basket
    user_session.add_item_to_basket({
      :item_id => params[:food_id],
      :api_id => params[:api_id]
    })

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
