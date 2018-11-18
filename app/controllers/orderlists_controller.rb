class OrderlistsController < ApplicationController
	before_action :authenticate_user!
  before_action :find_restaurant, only: [:new, :create ,:edit, :update, :destroy]
	
	def new
		@orderlist = Orderlist.new
	end

  def create

  	@orderlist = Orderlist.new(orderlist_params)
  	@orderlist.user_id = current_user.id
  	@orderlist.restaurant_id = @restaurant.id
  	@orderlist.is_closed = false

		if @orderlist.save
			redirect_to restaurants_path, notice: "訂購成功！"
		else
			render :action => :new
		end
  end

private

	def find_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

	def orderlist_params
    params.require(:orderlist).permit(:description, :price, :user_id, :restaurant_id)
  end

end
