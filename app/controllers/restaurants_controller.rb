class RestaurantsController < ApplicationController
		before_action :authenticate_user!
		before_action :find_restaurant, only: [:show, :order ,:edit, :update, :destroy]

	def index
		@restaurants = Restaurant.all
	end

	def show
	end

	def new
		@restaurant = Restaurant.new
	end

  def create
  	@restaurant = Restaurant.create(restaurant_params)

		if @restaurant.save
			redirect_to restaurants_path, notice: "新增餐廳成功！"
		else
			render :action => :new
		end
	end

	def edit
	end	

	def update
	@restaurant.update(restaurant_params)

		if @restaurant.save
			redirect_to restaurants_path, notice: "更新餐廳成功！"
		else
			render :action => :update
		end 
	end

	def destroy
		@restaurant.destroy

		redirect_to restaurants_path, notice: "刪除餐廳成功"
	end

	def ongoing
		@restaurants = Resraurant.all(where(:status == true))
	end

	private

	def find_restaurant
		@restaurant = Restaurant.find(params[:id])
	end

	def restaurant_params
    params.require(:restaurant).permit(:name, :address, :tel, :menu_photo)
  end

end
