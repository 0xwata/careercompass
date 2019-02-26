class JobExperiencesController < ApplicationController
  before_action :set_job_experience, only: [:show, :edit, :update, :destroy]

  # GET /job_experiences
  # GET /job_experiences.json
  def index
    @job_experiences = JobExperience.all
  end

  # GET /job_experiences/1
  # GET /job_experiences/1.json
  def show
  end

  # GET /job_experiences/new
  def new
    @job_experience = JobExperience.new
  end

  # GET /job_experiences/1/edit
  def edit
  end

  # POST /job_experiences
  # POST /job_experiences.json
  def create
    @job_experience = JobExperience.new(job_experience_params)

    respond_to do |format|
      if @job_experience.save
        format.html { redirect_to @job_experience, notice: 'Job experience was successfully created.' }
        format.json { render :show, status: :created, location: @job_experience }
      else
        format.html { render :new }
        format.json { render json: @job_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_experiences/1
  # PATCH/PUT /job_experiences/1.json
  def update
    respond_to do |format|
      if @job_experience.update(job_experience_params)
        format.html { redirect_to @job_experience, notice: 'Job experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_experience }
      else
        format.html { render :edit }
        format.json { render json: @job_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_experiences/1
  # DELETE /job_experiences/1.json
  def destroy
    @job_experience.destroy
    respond_to do |format|
      format.html { redirect_to job_experiences_url, notice: 'Job experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_experience
      @job_experience = JobExperience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_experience_params
      params.require(:job_experience).permit(:job_id, :user_id, :company_id, :start_of_date, :end_of_date)
    end
end
