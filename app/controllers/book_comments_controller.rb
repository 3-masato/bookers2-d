class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:destroy]

  def create
    book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = book.id
    @comment.save
    # redirect_to request.referer
  end

  def destroy
    @comment = BookComment.find(params[:id])
    comment.destroy
    # redirect_to request.referer
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def ensure_correct_user
    user = BookComment.find(params[:id]).user
    unless user == current_user
      redirect_to request.referer
    end
  end
end
