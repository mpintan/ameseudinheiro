require 'test_helper'

class LandingControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get cadastro" do
    get :cadastro
    assert_response :success
  end

end
