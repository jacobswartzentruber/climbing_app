require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:jake)
  end
  
  test "Sign in with invalid information" do
    get signup_path
    assert_template "users/new"
    assert_no_difference "User.count" do
      post users_path, user: {name: "", 
                               email: "invalid@foo",
                               password: "foo",
                               password_confirmation: "bar"}
    end
    assert_template "users/new"
  end
  
  test "Sign in with valid information" do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path, user: {name: "Valid user", 
                               email: "valid@foo.com",
                               password: "password",
                               password_confirmation: "password"}
    end
    user = assigns(:user)
    log_in_as(user)
    assert_redirected_to user_path(user)
    follow_redirect!
    assert_template "users/show"
    assert is_logged_in?
  end
end
