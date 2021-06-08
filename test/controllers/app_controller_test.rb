require "test_helper"

class AppControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get app_home_url
    assert_response :success
  end

  test "should get blog" do
    get app_blog_url
    assert_response :success
  end

  test "should get post" do
    get app_post_url
    assert_response :success
  end
end
