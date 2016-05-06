class UsersController < ApplicationController
	before_action :authenticate_user!
	def home 
		#@user = Users.find(params[:id])
    	@orders = Order.where(user_id: current_user.id)
    	@friends = User.where(id: Friend.where(user_id: current_user.id))
    	@friendOrders = Order.where(user_id: Friend.where(user_id: current_user.id))

	end	

	def index 
		@users = User.all
	end

	def show 
		@user = current_user
	end
end
