require 'bcrypt'
module CustomTestHelper
  include BCrypt

  def fake_login(user)
    post pw_login_path, params: {email: user.email, password: user.password}
  end
end