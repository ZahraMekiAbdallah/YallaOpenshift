class OrderObserver < ActiveRecord::Observer
  observe :order

  def after_create(order)
  	puts "new order added"
    order.logger.info('New order added!')
    # redirect_to order_path, :flash => { :success => "Message" }
  end

  def after_destroy(order)
    order.logger.warn("order with an id of #{order.id} was destroyed!")
  end
end