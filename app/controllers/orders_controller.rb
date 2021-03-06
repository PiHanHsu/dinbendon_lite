class OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :find_order, only: [:show, :order ,:edit, :closed,:update, :destroy]
  before_action :find_restaurant, only: [:new]

	def index 
		@orders = Order.where(:is_open => true)
	end

	def history
		@orders = Order.where(:user_id => current_user.id, :is_open => false )
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

	def closed
		@order.is_open = false
		@order.save

		if @order.save
			@orderlists = @order.orderlists
			@orderlists.each do |orderlist|
				@user = orderlist.user
				OrderConfirmMailer.send_orderlist(@user, @order).deliver_now
			end
			redirect_to orders_path, notice: "結束訂購！"
		else
			redirect_to restaurants_path, notice: "結束訂購失敗！"
		end
	end

  def destroy
		@order.destroy
		@orders = Order.where(:user_id => current_user.id, :is_open => false)
		redirect_to history_order_path(current_user), notice: "刪除餐廳成功"
	end

private

	def find_restaurant
		@restaurant = Restaurant.find(params[:format])
	end

	def find_order
		@order = Order.find(params[:id])
	end

	def order_params
    params.require(:order).permit(:user_id, :restaurant_id, :is_open, :deadline)
  end

end
