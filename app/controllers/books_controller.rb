class BooksController < ApplicationController
  def index
    books = Book.all

    redner json: books.as_json
  end

  def create
    book = Book.create!(title: params[:title], author: params[:author], pages: params[:pages], category: params[:category])

    render json: book.as_json
  end

  def show
    id = params[:id]
    book = Book.find(id)

    render json: book.as_json
  end

  def update
    id = params[:id]
    book = Book.find(id)

    book.update(
      book.title = params[:title] || book.title,
      book.author = params[:author] || book.author,
      book.pages = params[:pages] || book.pages,
      book.category = params[:category] || book.category
    )

    book.save

    render json: book.as_json
  end

  def destroy
    id = params[:id]
    book = Book.find(id)

    book.destroy

    render json: { message: "your book is gone!" }
  end
end
