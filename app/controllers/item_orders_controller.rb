class ItemOrdersController < ApplicationController
  # GET /item_orders
  # GET /item_orders.json
  def index
    @item_orders = ItemOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_orders }
    end
  end

  # GET /item_orders/1
  # GET /item_orders/1.json
  def show
    @item_order = ItemOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_order }
    end
  end

  # GET /item_orders/new
  # GET /item_orders/new.json
  def new
    @item_order = ItemOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_order }
    end
  end

  # GET /item_orders/1/edit
  def edit
    @item_order = ItemOrder.find(params[:id])
  end

  # POST /item_orders
  # POST /item_orders.json
  def create
    @item_order = ItemOrder.new(params[:item_order])

    respond_to do |format|
      if @item_order.save
        format.html { redirect_to order_path(@item_order.order_id), notice: 'Item order was successfully created.' }
        format.json { render json: @item_order, status: :created, location: @item_order }
      else
        format.html { render action: "new" }
        format.json { render json: @item_order.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /item_orders/1
  # PUT /item_orders/1.json
  def update
    @item_order = ItemOrder.find(params[:id])

    respond_to do |format|
      if @item_order.update_attributes(params[:item_order])
        format.html { redirect_to @item_order, notice: 'Item order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_orders/1
  # DELETE /item_orders/1.json
  def destroy
    @item_order = ItemOrder.find(params[:id])
    @item_order.destroy

    respond_to do |format|
      format.html { redirect_to item_orders_url }
      format.json { head :no_content }
    end
  end
end
