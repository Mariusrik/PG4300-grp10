require "application_system_test_case"

class WelcomeTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit welcome_url

    assert_selector "h1", text: "Books"
  end
end
