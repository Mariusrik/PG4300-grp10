class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, :only => [:show, :index]

  attr_accessor :books
  helper_method :get_avg
  helper_method :re_rate

  def get_avg(num)
    @get_avg = Rating.where(:book_id => num).average(:score)
  end

  def re_rate(book)
    @rating_search = Rating.where(:book_id => book).where(:user_id => current_user.id)
    if @rating_search.present?
      edit_rating_path(@rating_search.pluck(:id))
    else
      new_rating_path(:book => book)
    end
  end

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    @comment = Comment.new
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    require_admin
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_back(fallback_location: home_path,notice: 'Book was successfully created.') }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_back(fallback_location: home_path,notice: 'Book was successfully updated.') }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: home_path,notice: 'Book was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:bookId, :title, :description, :image, :category_id)
    end
end
