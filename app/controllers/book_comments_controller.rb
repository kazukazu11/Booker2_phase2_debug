class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(comment_params)
    @comment.book_id = params[:book_id]
    @comment.save
  end

  def destroy
    @comment = BookComment.find(params[:book_id])
    @book = @comment.book
    @comment.destroy
  end

  private
  def comment_params
    params.require(:book_comment).permit(:body)
  end
end
 