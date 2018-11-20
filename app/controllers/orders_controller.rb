class OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :find_order, only: [:show, :order ,:edit, :update, :destroy]
  before_action :find_restaurant, only: [:new]

	def index 
		@orders = Order.where(:is_open => true)
	end

	def new
		@order = Order.create(:user_id => current_user.id, :restaurant_id => @restaurant.id, :is_open => true)
		if @order.save
			redirect_to :root, notice: "開團成功！"
		else
			redirect_to restaurants_path, notice: "開團失敗！"
		end
	end

	def create
		@order = Order.create(:user_id => current_user.id, :restaurant_id => @restaurant_id, :is_open => true)
		if @order.save
			redirect_to orders_path, notice: "開團成功！"
		else
			redirect_to restaurant_path(@restaurant)
		end

	end


private

	def find_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

	def find_order
		@order = Order.find(params[:id])
	end

	def restaurant_params
    params.require(:order).permit(:user_id, :restaurant_id, :is_open, :deadline)
  end

end
