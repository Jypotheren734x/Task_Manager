require 'test_helper'

class GroupProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get group_projects_create_url
    assert_response :success
  end

  test "should get update" do
    get group_projects_update_url
    assert_response :success
  end

  test "should get destroy" do
    get group_projects_destroy_url
    assert_response :success
  end

end
