class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]


  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render new_item_path
      end
  end

  private
  def item_params
    params.require(:item).permit(
      :image, 
      :item_name,
      :explanation,
      :category_id,
      :content_id,
      :deliver_charge_id,
      :deliver_day_id,
      :prefecture_id,
      :price
    ).merge(user_id: current_user.id)
  end

end
