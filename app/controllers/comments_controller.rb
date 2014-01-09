class CommentsController < ApplicationController

  http_basic_authenticate_with name: "ganan", password: "Cho13561356", only: :destroy
 
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create( user_params )
    redirect_to post_path(@post)
  end
 
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def user_params
    params.require(:comment).permit(:commenter, :body, :title, :text, :tags_attributes, :image)
  end
end