require "application_system_test_case"

class LoginTest < ApplicationSystemTestCase
  test "lvalid with email and password" do
    u = User.create!(email: "test@mail.com", password: "Test123!", pin: "123456", role: "manager")
    visit login_path
    fill_in "Email", with: "test@mail.com"
    fill_in "Password", with: "Test123!"
    click_button "Login"
    assert_text "Logged in successfully"
  end

  test "log in with pin" do
    u = User.create!(email: "test@mail.com", password: "Test123!", pin: "123456", role: "manager")
    visit login_path
    fill_in "pin", with: "123456"
    click_button "Login"
    assert_text "PIN login"
  end

  test "not valid with wrong password" do
    u = User.create!(email: "test@mail.com", password: "Test123!", pin: "123456", role: "manager")
    visit login_path
    fill_in "Email", with: "test@mail.com"
    fill_in "Password", with: "Test123!Wrong"
    click_button "Login"
    assert_text "Invalid email or password."
  end

  test "log in with wrong pin" do
    u = User.create!(email: "test@mail.com", password: "Test123!", pin: "123456", role: "manager")
    visit login_path
    fill_in "pin", with: "123457"
    click_button "Login"
    assert_text "Invalid PIN."
  end
end