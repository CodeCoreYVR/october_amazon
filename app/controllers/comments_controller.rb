class CommentsController < ApplicationController
  def create
    comment_params   = params.require(:comment).permit(:body)
    @product         = Product.find params[:product_id]
    @comment         = Comment.new comment_params
    @comment.product = @product
    respond_to do |format|
      if @comment.save
        format.html { redirect_to product_path(@product) }
        format.js   { render :create_success }
      else
        format.html { render "/products/show" }
        format.js   { render :create_failure }
      end
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to product_path(@comment.product) }
      format.js   { render }
    end
  end
end
