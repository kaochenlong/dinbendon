class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])

    @comment = @item.comments.build(comment_params.merge(user: current_user))
    
    if @comment.save
      # /app/views/comments/create.html.erb
      # /app/views/comments/create.js.erb

      # render js: "alert('hi')"
      # render json: {name: '1111', age: 18}
      # redirect_to item_path(params[:item_id]), notice: 'ok'
    else
      render 'items/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
