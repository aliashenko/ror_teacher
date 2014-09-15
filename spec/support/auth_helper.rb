module AuthHelper
  def login(user)
    @current_user = user

    controller.stub(:require_login) { false }
    controller.stub(:current_user) { @current_user }
    # skips cancan authorization
    controller.stub(:authorize!) { nil }
    # skips cancan check_authorization
    controller.instance_variable_set(:@_authorized, true)
    controller.instance_variable_set(:@current_user, user)
  end
end
