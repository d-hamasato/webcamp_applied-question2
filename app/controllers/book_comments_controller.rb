class BookCommentsController < ApplicationController
  before_action :correct_user, only: [:destroy]
  
  def create
    @book = Book.find(params[:book_id])
    # @book_comment = @book.book_comment
    @book_comment = BookComment.new(book_comment_params)
    @book_comment .user_id = current_user.id
    @book_comment .book_id = @book.id
    unless @book_comment.save
      render 'error'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    comment.destroy
  end

  private
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
  
  def correct_user
    book_comment = BookComment.find(params[:id])
    if current_user.id != book_comment.user_id
      redirect_to books_path
    end
  end

end