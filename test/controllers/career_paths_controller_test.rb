require 'test_helper'

class CareerPathsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @career_path = career_paths(:one)
  end

  test "should get index" do
    get career_paths_url
    assert_response :success
  end

  test "should get new" do
    get new_career_path_url
    assert_response :success
  end

  test "should create career_path" do
    assert_difference('CareerPath.count') do
      post career_paths_url, params: { career_path: { from_career: @career_path.from_career, to_career: @career_path.to_career, user_id: @career_path.user_id } }
    end

    assert_redirected_to career_path_url(CareerPath.last)
  end

  test "should show career_path" do
    get career_path_url(@career_path)
    assert_response :success
  end

  test "should get edit" do
    get edit_career_path_url(@career_path)
    assert_response :success
  end

  test "should update career_path" do
    patch career_path_url(@career_path), params: { career_path: { from_career: @career_path.from_career, to_career: @career_path.to_career, user_id: @career_path.user_id } }
    assert_redirected_to career_path_url(@career_path)
  end

  test "should destroy career_path" do
    assert_difference('CareerPath.count', -1) do
      delete career_path_url(@career_path)
    end

    assert_redirected_to career_paths_url
  end
end
