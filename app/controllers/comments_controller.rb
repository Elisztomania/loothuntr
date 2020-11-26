class CommentsController < ApplicationController
  before_action :set_post, only: [:new, :create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user

    if @comment.save
      redirect_to @post
    else
      render :new
    end
  end

  # def edit
  #   @post = Post.find(params[:id])
  #   @comment = comment.find(params[:post_id])
  # end

  # def update
  #   @post = Post.find(params[:post_id])
  #   @comment = Comment.find(params[:id])
  #   if @comment.update(comment_params)
  #     redirect_to @post, notice: 'Votre avis a été correctement modifié.'
  #   else
  #     render :edit
  #   end
  # end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
