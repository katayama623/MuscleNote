class BooksController < ApplicationController

  def create
    @book = current_user.books.create(post_id: params[:post_id])
    redirect_to request.referer
  end

  def destroy
    @book = Book.find_by(post_id: params[:post_id], user_id: current_user.id)
    @book.destroy
    redirect_to request.referer
  end

end
