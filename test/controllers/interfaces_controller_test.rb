require 'test_helper'

class InterfacesControllerTest < ActionDispatch::IntegrationTest
  include CustomTestHelper
  setup do
    @user = Fabricate(:user)
    fake_login(@user)
    @interface = Fabricate(:interface)
  end

  test "should get index" do
    get interfaces_url
    assert_response :success
  end

  test "should get new" do
    get new_interface_url
    assert_response :success
  end

  test "should create interface" do
    assert_difference('Interface.count') do
      post interfaces_url, params: {interface: {id: @interface.id}}
    end

    assert_redirected_to interface_url(Interface.last)
  end

  test "should show interface" do
    get interface_url(@interface)
    assert_response :success
  end

  test "should get edit" do
    get edit_interface_url(@interface)
    assert_response :success
  end

  test "should update interface" do
    patch interface_url(@interface.id)
    assert_redirected_to interface_url(@interface)
  end

  test "should destroy interface" do
    assert_difference('Interface.count', -1) do
      delete interface_url(@interface)
    end

    assert_redirected_to interfaces_url
  end
end
