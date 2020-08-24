class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(comment_params)
    @comment.book_id = @book.id
    if @comment.save
      flash.now[:success] = "Comment was successfully created."
    end
    render :index
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.find_by(book_id: @book.id, id: params[:id])
    if @comment.destroy
      flash.now[:notice] = "Comment was successfully deleted"
    end
    render :index
  end

  private
  def comment_params
    params.require(:book_comment).permit(:comment)
  end

end
