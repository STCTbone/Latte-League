class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end


  def show
    @order = Order.find(params[:id])
    @item_order = ItemOrder.new
    tax_rate = .1
    @total = @order.total(tax_rate)
  end

  def my_orders
    @my_orders = Order.where(:user_id => current_user.id)
    @item_order = ItemOrder.new
  end

  def order_admin
    @orders = Order.all
    @waiting_orders = Order.where(:status => 'Waiting')
    @ready_orders = Order.where(:status => 'Ready')
    @completed_orders = Order.where(:status => 'Picked up')
  end



  def submit_order
      order = Order.find(params[:id])
    order.status='Waiting'
    order.save

    StatusMailer.order_email(order.user.id, order.id).deliver
    redirect_to my_orders_path
  end


  def fulfil_order
    order = Order.find(params[:id])
    order.status='Ready'
    order.save
    redirect_to order_admin_path
  end

  def complete_order
    order = Order.find(params[:id])
    order.status='Picked up'
    order.save
    redirect_to order_admin_path
  end

  def export_orders
    orders = Order.where(status: "Completed")
    send_data OrderExporter.new(orders).export_to_xls, :type=>"application/excel", :disposition=>'attachment', :filename => "orders_export_#{l(Date.today)}.xls"
end




  def new
    @order = Order.new
  end


  def edit
    @order = Order.find(params[:id])
  end


  def create
    @order = Order.new(params[:order])
    @order.total_price=0
      if @order.save
        redirect_to @order, notice: 'Order was successfully created.'
      else
        render action: "new"
      end

  end

  def update
    @order = Order.find(params[:id])


      if @order.update_attributes(params[:order])
        redirect_to @order, notice: 'Order was successfully updated.'
      else
        render action: "edit"
      end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_url
  end
end
