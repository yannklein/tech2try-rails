require 'test_helper'

class TechgetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get techgets_index_url
    assert_response :success
  end

  test "should get show" do
    get techgets_show_url
    assert_response :success
  end

  test "should get new" do
    get techgets_new_url
    assert_response :success
  end

  test "should get create" do
    get techgets_create_url
    assert_response :success
  end

  test "should get update" do
    get techgets_update_url
    assert_response :success
  end

  test "should get edit" do
    get techgets_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get techgets_destroy_url
    assert_response :success
  end

end
