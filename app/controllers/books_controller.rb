require 'pdf/reader'
class BooksController < ApplicationController
  # GET /books
  # GET /books.xml
  def index
    q = params[:q]
    page = params[:page]? params[:page].to_i : 1
    if params[:q] && q.strip.size > 0
      r = Sunspot.search(Book, Page) do
          keywords q #, :fields => [:content]
          paginate(:page => page, :per_page => 5)
        end
      @results = r.results
      @books = []
    else
      @books = Book.paginate :page => params[:page], :per_page => 5
      @results = []
    end
    respond_to do |format|
      format.html
    end
  end

  # GET /books/1
  # GET /books/1.xml
  def show
    @book = Book.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  def page_index(book)
    url = RAILS_ROOT + "/public" + book.file.url
  	receiver = PageTextReceiver.new
    pdf = PDF::Reader.file(url, receiver)
    page_number = 0
    receiver.content.each{|page|
      page_number += 1
      book.pages << Page.new(:content => page, :page => page_number)
    }
    Page.reindex
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])
    respond_to do |format|
      if @book.save
        page_index @book
        flash[:notice] = 'Book was successfully created.'
        format.html { redirect_to(@book) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        flash[:notice] = 'Book was successfully updated.'
        format.html { redirect_to(@book) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to(books_url) }
    end
  end
end

