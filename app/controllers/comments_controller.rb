class CommentsController < ApplicationController
  before_action :set_comment, only: :show
  before_action :set_item, only: [:create, :show]

  def create
    @comment = Comment.new(comment_params)
    @comment.attributes = {
      item_id: params[:item_id],
      user_id: current_user.id
    }
    if @comment.save
      redirect_to @comment.item, notice: "コメントしました"
    else
      redirect_to @comment.item
    end
  end



  def show

  end

  def destroy
    # @comment = Comment.find(id: current_comment.id)
    # comment.destroy
    # redirect_to item_path, notice: "コメントを削除しました。"    
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end  


end
