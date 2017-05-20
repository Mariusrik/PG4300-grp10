require 'test_helper'

class ForSalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @for_sale = for_sales(:one)
  end

  test "should get index" do
    get for_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_for_sale_url
    assert_response :success
  end

  test "should create for_sale" do
    assert_difference('ForSale.count') do
      post for_sales_url, params: { for_sale: { book_id: @for_sale.book_id, contact: @for_sale.contact, price: @for_sale.price, user_id: @for_sale.user_id } }
    end

    assert_redirected_to for_sale_url(ForSale.last)
  end

  test "should show for_sale" do
    get for_sale_url(@for_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_for_sale_url(@for_sale)
    assert_response :success
  end

  test "should update for_sale" do
    patch for_sale_url(@for_sale), params: { for_sale: { book_id: @for_sale.book_id, contact: @for_sale.contact, price: @for_sale.price, user_id: @for_sale.user_id } }
    assert_redirected_to for_sale_url(@for_sale)
  end

  test "should destroy for_sale" do
    assert_difference('ForSale.count', -1) do
      delete for_sale_url(@for_sale)
    end

    assert_redirected_to for_sales_url
  end
end
