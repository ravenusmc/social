require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should get new with new user" do
    get :new

    user = assigns(:user)

    assert user.new_record?
    assert_response :success
  end 

  test "should create user" do
    params = {
      user: {
        email: "user@example.com",
        password: "password",
        password_confirmation: "password"
      }
    }

    post :create, params

    assert_redirected_to root_url
  end

  test "should show user" do
    user =users(:user1)

    get :show, id: user.id

    assert assigns(:user)
    assert_response :success
  end
end
