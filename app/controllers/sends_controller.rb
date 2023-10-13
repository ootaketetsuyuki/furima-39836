class SendsController < ApplicationController
  before_action :find_item, only: [:create, :index]


  def index
    @purchase_send = PurchaseSend.new
  end

  def create
    @purchase_send = PurchaseSend.new(purchase_send_params)
    if @purchase_send.valid?
      @purchase_send.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def purchase_send_params
    params.require(:purchase_send).permit(:post_code, :prefecture_id, :city_name, :street_address, :building, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
