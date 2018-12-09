class Admin::RestaurantsController < ApplicationController
	before_action :authenticate_user!

	layout 'admin'

	def index
		@restaurants = Restaurant.all
	end

end
