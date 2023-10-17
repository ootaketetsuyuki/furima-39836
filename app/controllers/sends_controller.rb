class SendsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:create, :index]
  before_action :move_to_index

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_send = PurchaseSend.new
  end

  def create
    @purchase_send = PurchaseSend.new(purchase_send_params)
    if @purchase_send.valid?
      pay_item
      @purchase_send.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def purchase_send_params
    params.require(:purchase_send).permit(:post_code, :prefecture_id, :city_name, :street_address, :building, :phone_number)
    .merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_send_params[:token],
      currency: 'jpy'
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if @item.order.present? || current_user.id == @item.user_id
    redirect_to root_path
    end
  end
end
