class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all
  end

  def new
    # your code here
    render :new
  end

  def create
    # your code here
    book = Book.new(book_params)
    if book.save
      redirect_to books_url
    else
      flash.now[:errors] = book.errors.full_messages
      render :new
    end
  end

  def destroy
    # your code here
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
