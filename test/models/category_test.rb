require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "category_must_not_have_empty_name" do
    category = Category.new
    assert category.invalid?
    assert category.errors[:name].any?
  end

  test "categories_must_be_unique" do
    category = Category.create(name: "myCategory")
    assert category.valid?

    secondCategory = Category.create(name: "mySecondCategory")
    assert secondCategory.valid?

    thirdCategory = Category.create(name: "mySecondCategory")
    assert_not thirdCategory.valid?
  end

end


