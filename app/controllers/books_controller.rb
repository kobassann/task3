class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to book_path
  end


  def index
    # @book = Book.find(params[:id])
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct__user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end
