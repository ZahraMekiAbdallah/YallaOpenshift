class OrdersController < ApplicationController
  before_action  :set_order,only: [:show, :edit, :update, :destroy,:cancel]
  before_action :authenticate_user!

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # update Order status
  def cancel
   @order = Order.find_by(id: params[:id])
   @order.update_attributes(:status => 'Cancelled')
   @order.save()
   respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
   end
 end
 # Hello action

 def hello
    respond_to do |format|
      format.js { render :layout=>false }
    end
  end
 # update Order status
 def finish
  @order = Order.find_by(id: params[:id])
  @order.update_attributes(:status => 'Finished')
  @order.save()
  respond_to do |format|
     format.html { redirect_to orders_url }
     format.json { head :no_content }
     format.js   { render :layout => false }
  end
end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @currentUser = current_user.id
    @order['user_id'] = @currentUser
    @order['status'] = 'Waiting'

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def setFinished
    @order.update(status: 'finished')
    respond_to do |format|
      format.html { redirect_to @order }
      format.json { head :no_content }
    end
  end


  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :order_for, :status, :resturant, :menu_image,:avatar)
    end
end
