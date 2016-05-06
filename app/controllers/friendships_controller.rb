class FriendshipsController < ApplicationController

 
  def create
   @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Error occurred when adding friend."
      redirect_to root_url
    end
  end
  
  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  # def update
  #   respond_to do |format|
  #     if @friend.update(friend_params)
  #       format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @friend }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @friend.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
   @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Successfully destroyed friendship."
    redirect_to root_url
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_friend
  #     @friend = Friend.find(params[:id])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def friend_params
  #     params.require(:friend).permit(:user_id, :friend_id)
  #   end
end
