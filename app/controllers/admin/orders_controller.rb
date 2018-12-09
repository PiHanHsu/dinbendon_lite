class Admin::OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :find_order, only: [:show, :order ,:edit, :closed,:update, :destroy]

	layout 'admin'

	def index
		@orders = Order.all
	end

	def overview
		@users = User.all
		@orders = Order.all
		@restaurants = Restaurant.all
		@orderlists = Orderlist.all
	end

	def destroy
		@order.destroy
		@orders = Order.all
		redirect_to admin_orders_path, notice: "刪除訂單成功"
	end

private

	def find_order
		@order = Order.find(params[:id])
	end

	def order_params
    params.require(:order).permit(:user_id, :restaurant_id, :is_open, :deadline)
  end

end
