class BooksController < ApplicationController

  before_action :find_book, only: [:edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      # flash[:notice] = "新增成功"
      # redirect_to "/books"                       可合併如下一行
      redirect_to "/books", notice: "新增成功"
    else
      render :new
    end
  end

  def edit
    # @book = Book.find_by(id: params[:id])        before_action
  end

  def update
    # @book = Book.find_by(id: params[:id])        before_action

    if @book.update(book_params)
      # flash[:notice] = "更新成功"
      # redirect_to "/books"                       可合併如下一行
      redirect_to "/books", notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    # @book = Book.find_by(id: params[:id])        before_action
  
    # if @book
    #   @book.destroy                              等同於@book.destroy if @book (只有在一行時可以縮寫)
    # end                                          當if後面的條件成立時執行
    @book.destroy if @book

    # flash[:notice] = "刪除成功"
    # redirect_to "/books"                         可合併如下一行
    redirect_to "/books", notice: "刪除成功"
  end


    private
    def book_params
      params.require(:book).permit(:name, :author, :price)
    end

    def find_book
      @book = Book.find_by(id: params[:id])
    end

end
