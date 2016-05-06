class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # def groups
  #   #list all groups
  #   @groups = Group.where(user_id: current_user.id)
  # end

  # GET /groups
  # GET /groups.json
  def index

    if(params[:id] != nil)
    @groupParam = Group.find(params[:id])
    @GM = GroupMember.where(group_id: params[:id])

  end
    @group_member = GroupMember.new
    @group = Group.new
    @groups = Group.where(user_id: current_user.id)
  
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @GM = GroupMember.where(group_id: params[:id])
    @group_member = GroupMember.new
    @group = Group.new
    @groups = Group.where(user_id: current_user.id)

    @groupParam = Group.find(params[:id])

   render('index')
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    respond_to do |format|
      # @group = Group.new(group_params)
      @myGr = Group.where(user_id: current_user.id, name: group_params[:name])

    if group_params[:name] == "" 
      #@test == group_params[:name]
      #allGroups.exclude?(group_params[:name])
      format.html { redirect_to groups_url, notice: 'Sorry it is empty or repeated, please enter valid data' }
      format.json { render :show, status: :created, location: @group } 
     else   

      @group = Group.new(group_params)
      @group.save
        format.html { redirect_to groups_url, notice: '' }
        format.json { render :show, status: :created, location: @group } 
    end
 
  end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    if @x 
    @x.destroy
   else
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end  
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:user_id, :name)
    end
end
