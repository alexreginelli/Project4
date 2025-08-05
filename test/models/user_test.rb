require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid with right email, password, PIN" do
    u = User.new(name: "TestName", surname: "TestSurname", role: "TestRole", email: "test@mail.com", password: "ValidPassword123!", pin: "123456")
    assert u.valid?
  end

  test "not valid with wrong password and PIN" do
    u = User.new(name: "TestName", surname: "TestSurname", role: "TestRole", email: "test@mail.com", password: "Val23", pin: "123")
    assert_not u.valid?
  end
end
