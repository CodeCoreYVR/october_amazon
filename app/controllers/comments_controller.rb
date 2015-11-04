class CommentsController < ApplicationController
  def create
    comment_params   = params.require(:comment).permit(:body)
    @product         = Product.find params[:product_id]
    @comment         = Comment.new comment_params
    @comment.product = @product
    if @comment.save
      redirect_to product_path(@product)
    else
      render "/products/show"
    end
  end
end
