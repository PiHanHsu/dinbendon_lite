class OrderlistsController < ApplicationController
	before_action :authenticate_user!
  before_action :find_order, only: [:index, :new ,:create]
  before_action :find_orderlist, only: [:edit, :update, :destroy]
	
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

		if @orderlist.save
			redirect_to :root, notice: "訂購成功！"
		else
			render :action => :new
		end
  end

	def edit
		#@order = @orderlist.order
	end

	def update
		@orderlist.update(orderlist_params)

		if @orderlist.save
			redirect_to order_orderlists_path(@orderlist.order), notice: "更新訂單成功！"
		else
			render :action => :edit
		end 
	end

	def destroy
		@orderlist.destroy

		if @orderlist.save
			redirect_to order_orderlists_path(@orderlist.order), notice: "刪除訂單成功！" 
		end 

	end

private

	def find_order
		@order = Order.find(params[:order_id])
		@restaurant = @order.restaurant
	end

	def find_orderlist
		@orderlist = Orderlist.find(params[:id])
	end

	def orderlist_params
    params.require(:orderlist).permit(:description, :price, :user_id, :restaurant_id, :order_id, :quantity, :item)
  end

end
