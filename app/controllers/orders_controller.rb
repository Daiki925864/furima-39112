class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    @order_purchaser = OrderPurchaser.new
  end

  def create
    @order_purchaser = OrderPurchaser.new(order_purchaser_params)
    if @order_purchaser.valid?
      pay_item
      @order_purchaser.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_purchaser_params
    params.require(:order_purchaser).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_purchaser_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    end
  end

end
