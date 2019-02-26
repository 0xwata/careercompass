require 'test_helper'

class JobExperienceLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_experience_link = job_experience_links(:one)
  end

  test "should get index" do
    get job_experience_links_url
    assert_response :success
  end

  test "should get new" do
    get new_job_experience_link_url
    assert_response :success
  end

  test "should create job_experience_link" do
    assert_difference('JobExperienceLink.count') do
      post job_experience_links_url, params: { job_experience_link: { position_from: @job_experience_link.position_from, position_to: @job_experience_link.position_to, user_id: @job_experience_link.user_id } }
    end

    assert_redirected_to job_experience_link_url(JobExperienceLink.last)
  end

  test "should show job_experience_link" do
    get job_experience_link_url(@job_experience_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_experience_link_url(@job_experience_link)
    assert_response :success
  end

  test "should update job_experience_link" do
    patch job_experience_link_url(@job_experience_link), params: { job_experience_link: { position_from: @job_experience_link.position_from, position_to: @job_experience_link.position_to, user_id: @job_experience_link.user_id } }
    assert_redirected_to job_experience_link_url(@job_experience_link)
  end

  test "should destroy job_experience_link" do
    assert_difference('JobExperienceLink.count', -1) do
      delete job_experience_link_url(@job_experience_link)
    end

    assert_redirected_to job_experience_links_url
  end
end
