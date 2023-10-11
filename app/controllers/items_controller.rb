class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
      @item = Item.find(params[:id])
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        render :edit, status: :unprocessable_entity
      end
    end


  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :situation_id, :prefecture_id, :address_id,
                                 :day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?
    redirect_to action: :index
  end
end
