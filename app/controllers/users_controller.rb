class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @items = Item.where(saler_id: params[:id]).order(updated_at: :desc)
  end
end

