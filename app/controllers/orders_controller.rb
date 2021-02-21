class OrdersController < ApplicationController

  def new
    @space = Space.find(params[:id])
    order = Order.new
  end

  def create
    @space = Space.find(params[:id])
    order = Order.create(space_id: space.id, user_id: current_user.id)
    if order.save
        redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def order_params
    permit.require(:order).merge(space_id: space.id, user_id: carrent_user.id)
  end

end
