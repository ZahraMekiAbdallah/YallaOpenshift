class UsersController < ApplicationController
	before_action :authenticate_user!
	def home
		#@user = Users.find(params[:id])
    	@orders = Order.where(user_id: current_user.id)
    	@friends = User.where(id: Friend.where(user_id: current_user.id))
    	@friendOrders = Order.where(user_id: Friend.where(user_id: current_user.id))
	end
# ------ getFriendList -------
	def getFriendList
		suggestions = User.where(["users.email like ?","#{params[:keyword]}%"])
		arr = Array.new
		suggestions.each do |suggestion|
			arr.push suggestion.email
		end
		render :json => {emails: arr}
	end

# --------- getFriendId ---------
def getFriendId
	user = User.find_by(email: params[:femail])
	if user.nil?
		render :json => {user: nil, err: params[:str]+" is not on the system"}
	else
		row = Friendship.where("user_id = ? AND friend_id = ?", current_user.id, user.id)
		if row.blank?
			render :json => {user: nil, err: params[:str]+" is not your friend"}
		else
			render :json => {user: user}
		end
	end
end
# --------
	def index
		@users = User.all
	end

	def show
		@user = current_user
	end
end
