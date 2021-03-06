class GroupMembersController < ApplicationController
  before_action :set_group_member, only: [:show, :edit, :update, :destroy]

  # GET /group_members
  # GET /group_members.json
  def index
    @group_members = GroupMember.all
  end

  # GET /group_members/1
  # GET /group_members/1.json
  def show
  end

  # GET /group_members/new
  def new
    @group_member = GroupMember.new
  end

  # GET /group_members/1/edit
  def edit
  end

  # POST /group_members
  # POST /group_members.json
  def create
    respond_to do |format|
######user_id == name of user
    @allIds = User.where(name: group_member_params[:user_id]).ids

    # @myGr = GroupMember.where(group_id: group_member_params[:group_id], user_id: User.where(name: group_member_params[:user_id]).ids)
    @gTest = Group.find(group_member_params[:group_id])


    @allIds.each do |id|

    @chkFrnd = Friendship.where(user_id: current_user.id, friend_id: id)
    puts"tessssst"
    puts !@chkFrnd.empty?
    @myGr = GroupMember.where(group_id: group_member_params[:group_id], user_id: id)

    if current_user.id != id and !@chkFrnd.empty?
        @group_member = GroupMember.new(user_id: id,group_id: group_member_params[:group_id])
        @group_member.save
        format.html { redirect_to @gTest , notice: '' }
        format.json { render :show, status: :created, location: @group_member }
    end
    end
    if 
        format.html { redirect_to @gTest , notice: 'Sorry please enter valid data' }
        format.json { render :show, status: :created, location: @group_member }
    end 
  end
  end
  # PATCH/PUT /group_members/1
  # PATCH/PUT /group_members/1.json
  def update
    respond_to do |format|
      if @group_member.update(group_member_params)
        format.html { redirect_to @group_member, notice: 'Group member was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_member }
      else
        format.html { render :edit }
        format.json { render json: @group_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_members/1
  # DELETE /group_members/1.json
  def destroy
    @group_member.destroy
    @group = Group.find(@group_member.group_id)
    respond_to do |format|
      format.html { redirect_to @group , notice: 'Group member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_member
      @group_member = GroupMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_member_params
      params.require(:group_member).permit(:group_id, :user_id)
    end
end
