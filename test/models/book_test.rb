require 'test_helper'

class BookTest < ActiveSupport::TestCase

  def setup
    @category_one = categories(:one)
    @category_two = categories(:two)
  end

  test "title must be uniqeue" do
    book = Book.create(title: "MyValidBook", description: "blablabla", image: "image.png", category_id: @category_one.id)
    assert book.valid?

    book = Book.create(title: "MyValidBook", description: "blablabla", image: "image.png", category_id: @category_two.id)
    assert book.invalid?
  end

  test "title cannot be empty" do
    book = Book.new(description: "blablabla", image: "image.png", category_id: @category_one.id)
    assert book.invalid?

    book.title = "MyValidBook"
    assert book.valid?
  end

  test "description cannot be empty" do
    book = Book.create(title: "MyValidBook", image: "image.png", category_id: @category_one.id)
    assert book.invalid?

    book.description = "blablabla"
    assert book.valid?
  end

  test "created at is automaticly added when created" do
    book = Book.new(title: "MyValidBook", description: "blablabla", image: "image.png", category_id: @category_one.id)
    assert book.valid?

    assert_nil book.created_at
    assert_nil book.updated_at

    book = Book.create(title: "MyValidBook", description: "blablabla", image: "image.png", category_id: @category_one.id)

    assert_not_nil book.created_at
    assert_not_nil book.updated_at
  end

  test "book must have a category" do
    book = Book.new(title: "MyValidBook", description: "blablabla", image: "image.png")
    assert book.invalid?

    book.category_id = @category_one
    assert book.valid?
  end

end
