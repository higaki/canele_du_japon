class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    @caneles = Canele.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @canele = Canele.where(id: @order.canele_id).first
  end

  # GET /orders/new
  def new
    @time = 
      Time.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
    @caneles = saled_caneles
    @order = Order.new(bought_on: @time.strftime('%Y-%m-%d'))
  end

  # GET /orders/1/edit
  def edit
    @time = @order.bought_on
    @caneles = saled_caneles
  end

  # POST /orders
  # POST /orders.json
  def create
    date = Date.parse(order_params[:bought_on])
    @time = Time.new(date.year, date.month, date.day)

    @orders = order_params
      .reject{|order,| order == "bought_on"}.values
      .reject{|order| order[:count].empty? || order[:count].to_i == 0}
      .map do |order|
      Order.create(
        bought_on: @time, canele_id: order[:canele_id], count: order[:count])
    end

    respond_to do |format|
      if @orders.any?{|o| o.id.nil?}
        format.html {render action: 'new'}
      else
        format.html {redirect_to orders_path}
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
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
      params.require(:order).permit(:bought_on, :canele_id, :count,
        *Canele.all.map{|c| {c.id.to_s => [:count, :canele_id]}})
    end

    def saled_caneles
      Canele.where('started_from <= ? AND discontinued_in >= ?', @time, @time)
    end
end
