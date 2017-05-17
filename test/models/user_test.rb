require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user_name_cannot_be_empty" do
    user = User.new(password_digest: "validPassword123", email: "thisIs@valid.mail")
    assert user.invalid?
  end

  test "user_mail_cannot_be_empty" do
    user = User.new(name: "validName", password_digest: "validPassword123")
    assert user.invalid?
  end

  test "user_password_cannot_be_empty" do
    user = User.new(name: "validName", email: "thisIs@valid.mail")
    assert user.invalid?
  end

  test "user_should_be_created_when_name_password_mail_entered" do
    user = User.new(name: "validName", email: "thisIs@valid.mail")
    assert user.invalid?
  end

  test "user_mail_cannot_be_empt" do
    user = User.new(name: "validName", email: "thisIs@valid.mail")
    assert user.invalid?

    user2 = User.new(name: "validName", password_digest: "validPassword123")
    assert user2.invalid?

    user3 = User.new(password_digest: "validPassword123", email: "thisIs@valid.mail")
    assert user3.invalid?

    user4 = User.new(name: "validName", password_digest: "validPassword123", email: "thisIs@valid.mail")
    assert user4.valid?
  end

  test "email_must_be_uniqeue" do
    user = User.create(name: "validName", password_digest: "validPassword123", email: "thisIs@valid.mail")
    assert user.valid?

    user2 = User.create(name: "validName", password_digest: "validPassword123", email: "thisIs@valid.mail")
    assert user2.invalid?
  end

  test "format_on_email_must_be_followed" do
    user = User.new(name: "validName", password_digest: "validPassword123", email: "invalidMail")
    assert user.invalid?

    user2 = User.new(name: "validName", password_digest: "validPassword123", email: "invalid@Mail")
    assert user2.invalid?

    user3 = User.new(name: "validName", password_digest: "validPassword123", email: "valid@Mail.no")
    assert user3.valid?
  end

  test "password_must_have_atleast_one_number" do
    user = User.new(name: "validName", password_digest: "invalidPassword", email: "valid@Mail.no")
    assert user.invalid?
  end

  test "password_must_be_8_long" do
    user = User.new(name: "validName", password_digest: "toShort", email: "valid@Mail.no")
    assert user.invalid?
  end

  test "password_is_valid_when_8long_and_1number" do
    user = User.new(name: "validName", password_digest: "enogh123", email: "valid@Mail.no")
    assert user.valid?
  end

  test "created_and_created_at_is_automaticly_added" do
    user = User.create(name: "validName", password_digest: "enogh123", email: "valid@Mail.no")
    assert user.valid?

    assert_not_nil user.created_at
    assert_not_nil user.updated_at
  end

  test "user_profile_should_be_set_to_user_by_default" do
    user = User.new(name: "validName", password_digest: "enogh123", email: "valid@Mail.no")
    assert user.valid?

    assert_equal user.user_profile, "user"
  end

  test "salt_is_automaticly_added" do
    user = User.create(name: "validName", password_digest: "enogh123", email: "valid@Mail.no")
    assert user.valid?

    assert_not_nil user.password_salt
  end

end

=begin - Missing tests:
  checking validation of image (carrierwave kinda does this so idk)
=end