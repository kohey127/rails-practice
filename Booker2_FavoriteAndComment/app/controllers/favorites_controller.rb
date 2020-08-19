class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    # favorite = Favorite.new
    # favorite.book_id = book.id
    # favorite.user_id = current_user.id
    favorite.save
    redirect_back(fallback_location: root_path)
  end
  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :book_id)
  end
  
end
