class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @item_order = ItemOrder.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
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
    require 'rubygems'
    require 'yaml'

    orders = Order.all
      @export = orders

  book = Spreadsheet::Workbook.new
  sheet1 = book.create_worksheet :name => 'Orders export'
  sheet1.row(0).concat ["Username", "Completed Time", "Total Price"]
  @export.each_with_index do |t, i|
    sheet1.row(i+1).concat([ t.user.email, t.updated_at, t.total_price])
  end

  require 'stringio'
  data = StringIO.new ''
  book.write data
  send_data data.string, :type=>"application/excel", :disposition=>'attachment', :filename => "orders_export_#{l(Date.today)}.xls"
end



  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    @order.total_price=0
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end


  def chart

  end
end
