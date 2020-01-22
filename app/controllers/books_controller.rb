class BooksController < ApplicationController

  before_action :authenticate_user!, only: [:index, :show, :create, :edit, :uptade,
    :destroy]
  before_action :correct_user, only: [:edit, :destroy]
  def correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end

  def top
  end

  def index
  	@books = Book.all
    @book = Book.new
    @user =  current_user
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = @book.user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
     if @book.save
    redirect_to book_path(@book), notice: "successfully"
    else
      # binding.pry
      @books = Book.all
      @user =  current_user
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "successfully"
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end



  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
