class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end 

    def show
    end

    def edit
    end

    def update
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @item = Item.find(params[:id])
      @item.destroy
      redirect_to root_path
    end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :situation_id, :prefecture_id, :address_id,
                                 :day_id, :price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user_id
    redirect_to action: :index
    end
  end
end
