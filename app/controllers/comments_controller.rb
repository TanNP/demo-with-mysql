class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # def index
  #   @comments = Comment.all
  #   respond_with(@comments)
  # end

  # def show
  #   respond_with(@comment)
  # end

  # def new
  #   @comment = Comment.new
  #   respond_with(@comment)
  # end

  # def edit
  # end

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comment.new(comment_params)
      if @comment.save
        # redirect_to products_path(@product)
        redirect_to @product
      end

    

  end

  # def update
  #   @comment.update(comment_params)
  #   respond_with(@comment)
  # end

  def destroy
    @comment.destroy
    respond_to do |format|
        format.html { redirect_to product_path(@comment.product_id )}
      end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:title, :author, :rating, :content, :product_id)
    end
end
