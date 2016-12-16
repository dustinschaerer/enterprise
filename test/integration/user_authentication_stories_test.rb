require 'test_helper'

class UserAuthenticationStoriesTest < ActionDispatch::IntegrationTest
   fixtures :all
  def setup
    @user = users(:john)
  end

  test 'allows a user to register' do
    visit new_user_registration_path
    fill_in "Email", :with => 'newuser@example.com'
    fill_in 'user_password', :with => 'password'
    fill_in "user_password_confirmation", :with => 'password'
    click_button 'Sign up'
    assert has_content?("My Profile"), "Does not have 'My Profile'"
  end

  test "should allow a registered user to sign in" do
    visit new_user_session_path
    assert_equal new_user_session_path, current_path, "Path is not new_user-session_path"
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => "password"
    click_on 'Log in'
    assert_equal profile_path(@user.id), current_path, "Current Path is #{current_path}"
    assert has_content?("My Profile"), "Does not have 'My Profile'"
  end

  test "should not allow a registered user to sign in with wrong email" do
    visit new_user_session_path
    assert_equal new_user_session_path, current_path, "Current Path is #{current_path}"
    fill_in "Email", :with => "wrongaddress@example.com"
    fill_in "Password", :with => @user.password
    click_on 'Log in'
    assert has_content?("Log in"), "Did not display invalid email or password message"
  end

  test "should not allow a registered user to sign in with wrong password" do
    visit new_user_session_path
    assert_equal new_user_session_path, current_path
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => "wrongpassword"
    click_on 'Log in'
    assert has_content?("Log in"), "Did not display invalid email or password message"
  end

  test "should not allow a user to sign in with wrong user and password" do
    visit new_user_session_path
    assert_equal new_user_session_path, current_path
    fill_in "Email", :with => "wrongemail@example.com"
    fill_in "Password", :with => "wrongpassword"
        click_on 'Log in'
    assert has_content?("Log in"), "Did not display invalid email or password message"
  end
end
