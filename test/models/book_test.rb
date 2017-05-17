require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @category_one = categories(:one)
    @category_two = categories(:two)
  end

  test "title_must_be_uniqeue" do
    book = Book.create(title: "MyValidBook", description: "blablabla", image: "image.png", category_id: @category_one.id)
    assert book.valid?

    book = Book.create(title: "MyValidBook", description: "blablabla", image: "image.png", category_id: @category_two.id)
    assert book.invalid?
  end

  test "title_cannot_be_empty" do
    book = Book.new(description: "blablabla", image: "image.png", category_id: @category_one.id)
    assert book.invalid?

    book = Book.new(title: "MyValidBook", description: "blablabla", image: "image.png", category_id: @category_two.id)
    assert book.valid?
  end

  test "description_cannot_be_empty" do
    book = Book.create(title: "MyValidBook", image: "image.png", category_id: @category_one.id)
    assert book.invalid?

    book.description = "blablabla"
    assert book.valid?
  end

  test "created_at_is_automaticly_added_when_created" do
    book = Book.new(title: "MyValidBook", description: "blablabla", image: "image.png", category_id: @category_one.id)
    assert book.valid?

    assert_nil book.created_at
    assert_nil book.updated_at

    book = Book.create(title: "MyValidBook", description: "blablabla", image: "image.png", category_id: @category_one.id)

    assert_not_nil book.created_at
    assert_not_nil book.updated_at
  end

  test "book_must_have_a_category" do
    book = Book.new(title: "MyValidBook", description: "blablabla", image: "image.png")
    assert book.invalid?

    book.category_id = @category_one.id
    assert book.valid?
  end


end

=begin
  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "image"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_books_on_category_id"
  end

  belongs_to :category
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :image, BookUploader

  validates_presence_of :title, :description
  validates_uniqueness_of :title

=end