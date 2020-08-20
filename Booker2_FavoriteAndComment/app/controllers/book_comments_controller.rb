class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(comment_params)
    comment.book_id = book.id
    if comment.save
      flash[:success] = "Comment was successfully created."
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.find_by(book_id: book.id, id: params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:book_comment).permit(:comment)
  end

end
