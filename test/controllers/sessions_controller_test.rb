require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  include CustomTestHelper
  def setup
    @user = Fabricate(:user)
  end

  test 'can log in with good password' do
    fake_login(@user)
    assert_response 200
  end

  test 'can not log in with bad password' do
    post pw_login_path, params: {email: @user.email, password: 'wrongpw'}
    assert_response 302
  end
end