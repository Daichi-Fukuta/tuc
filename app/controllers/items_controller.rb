class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy, :buy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] 


  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.attributes = {
      saler: current_user
    }
    if @item.save
      redirect_to @item, notice: '出品が完了しました'
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @item = Item.with_attached_image.includes(:users).find(params[:id])
    if params[:buy]
      @item.attributes = {
        buyer: current_user.id
      }
      redirect_to "/items/index", notice: "購入しました。手続きを行ってください"
    end
    
  end


  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: '商品情報を編集しました'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to user_path, notice: '商品を削除しました'
  end

  def buy
  end

  def procedure

  end

  private

  def item_params
    params.require(:item).permit(:saler_id, :buyer_id, :name, :price, :description, :new_image, :category_id, :second_category_id, :state_id, :postage_id, :region_id, :shipping_date_id) 
  end



  def set_item
    @item = Item.find(params[:id])
  end

end
