class OrderlistsController < ApplicationController
	before_action :authenticate_user!
  before_action :find_order, only: [:index, :new ,:create]
	
  def index
    @orderlists = @order.orderlists.all
  end

	def new
		@orderlist = Orderlist.new
	end

  def create

  	@orderlist = Orderlist.new(orderlist_params)
  	@orderlist.user_id = current_user.id
  	@orderlist.order_id = @order.id
  	#@orderlist.restaurant_id = @restaurant.id

		if @orderlist.save
			redirect_to :root, notice: "訂購成功！"
		else
			render :action => :new
		end
  end

private

	def find_order
		@order = Order.find(params[:order_id])
		@restaurant = @order.restaurant
	end

	def orderlist_params
    params.require(:orderlist).permit(:description, :price, :user_id, :restaurant_id, :order_id, :quantity, :item)
  end

end
