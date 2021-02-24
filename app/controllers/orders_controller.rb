class OrdersController < ApplicationController

  def new
    order = Order.new
    # binding.pry
  end

  def create
    @space = Space.find(params[:space_id])
    order = Order.create!(space_id: params[:space_id], user_id: current_user.id)
    respond_to do |format|
      if order.save
        format.json {}
      else
        format.json { render json: order.error, status: :unprocessable_entity }
      end
    end
  end

  private

  def order_params
    permit.require(:order).merge(space_id: space.id, user_id: carrent_user.id)
  end

end
