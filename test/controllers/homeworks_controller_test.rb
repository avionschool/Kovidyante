require 'test_helper'

class HomeworksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homeworks_index_url
    assert_response :success
  end

  test "should get new" do
    get homeworks_new_url
    assert_response :success
  end

  test "should get create" do
    get homeworks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get homeworks_destroy_url
    assert_response :success
  end

end
