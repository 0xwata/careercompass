require 'test_helper'

class JobExperiencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_experience = job_experiences(:one)
  end

  test "should get index" do
    get job_experiences_url
    assert_response :success
  end

  test "should get new" do
    get new_job_experience_url
    assert_response :success
  end

  test "should create job_experience" do
    assert_difference('JobExperience.count') do
      post job_experiences_url, params: { job_experience: { company_id: @job_experience.company_id, end_of_date: @job_experience.end_of_date, job_id: @job_experience.job_id, start_of_date: @job_experience.start_of_date, user_id: @job_experience.user_id } }
    end

    assert_redirected_to job_experience_url(JobExperience.last)
  end

  test "should show job_experience" do
    get job_experience_url(@job_experience)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_experience_url(@job_experience)
    assert_response :success
  end

  test "should update job_experience" do
    patch job_experience_url(@job_experience), params: { job_experience: { company_id: @job_experience.company_id, end_of_date: @job_experience.end_of_date, job_id: @job_experience.job_id, start_of_date: @job_experience.start_of_date, user_id: @job_experience.user_id } }
    assert_redirected_to job_experience_url(@job_experience)
  end

  test "should destroy job_experience" do
    assert_difference('JobExperience.count', -1) do
      delete job_experience_url(@job_experience)
    end

    assert_redirected_to job_experiences_url
  end
end
