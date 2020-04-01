class FavoritesController < ApplicationController
  before_action :authenticate_user!
  # POST /books/:book_id/favorites
  # POST /favorites.json
  def create
    @book = Book.find(params[:book_id])
    @favorite = current_user.favorites.new(book_id: params[:book_id])
    @favorite.save
  end


  # DELETE /books/:book_id/favorites/
  def destroy
    @book = Book.find(params[:book_id])
    @favorite = Favorite.find_by(user_id: current_user, book_id: params[:book_id])
    @favorite.destroy
  end
end
