require 'test_helper'

class BlogFlowTest < ActionDispatch::IntegrationTest

  def setup
    @category_one = categories(:one)
    @category_two = categories(:two)
    @user = users(:user)
    @admin_one = users(:admin)

    @user_new = User.create(name: "validName", password_digest: "secret123", email: "thisIs@valid.mail")

  end

  test "can see the welcome page" do
    get "/"
    assert_select "h1", "Books"
  end



  test "user can login" do
    get "/log_in"
    assert_equal 200, status

    post "/sessions", params: { email: @user_new.email, password_digest: "secret123" }
    follow_redirect!
    assert_equal 200, status
    assert_equal "/", path

  end

  test "can create a new book" do
    post "/sessions", params: { email: @user_new.email, password_digest: "secret123" }

    get "/books/new"
    assert_response :success

    post "/books", params: {
        book: {
            title: "myTitle",
            description: "myDesc",
            image: "image.png",
            category_id: @category_one.id
        }}

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Book was successfully created."
  end

  test "can create new user" do
    get "/sign_up"
    assert_equal 200, status

    post "/users", params: { user: { email: "mail@mail.mail", password_digest: "secret" }}
    #follow_redirect!
    assert_equal 200, status
    assert_equal "/home", path
  end
end


=begin
  title: MyString
  description: MyString
  image: MyString.png
  category: one

  test "can create new user" do
    get "/sign_up"
    assert_equal 200, status

    post "/users", params: { user: { email: @user_one.email, password_digest: "secret" }}
    follow_redirect!
    assert_equal 200, status
    assert_equal "/home", path
  end

=end