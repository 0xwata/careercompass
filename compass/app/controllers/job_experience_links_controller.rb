class JobExperienceLinksController < ApplicationController
  before_action :set_job_experience_link, only: [:show, :edit, :update, :destroy]

  # GET /job_experience_links
  # GET /job_experience_links.json
  def index
    #Viewのformで取得したパラメータをモデルに渡す company_fromについて
    from_id_obj = Company.search_id_from_company_name(params[:search_from])
    @search_from = JobExperienceLink.search_from(from_id_obj.id)
    #Viewのformで取得したパラメータをモデルに渡す company_toについて
    to_id_obj = Company.search_id_from_company_name(params[:search_to])
    @search_to = JobExperienceLink.search_to(to_id_obj.id)
    @search_to.each do |search_to|
	    puts search_to.user_id
	    puts search_to.position_from
	    puts search_to.position_to
	    puts ''
    end
  end

  # GET /job_experience_links/1
  # GET /job_experience_links/1.json
  def show
  end

  # GET /job_experience_links/new
  def new
    @job_experience_link = JobExperienceLink.new
  end

  # GET /job_experience_links/1/edit
  def edit
  end

  # POST /job_experience_links
  # POST /job_experience_links.json
  def create
    @job_experience_link = JobExperienceLink.new(job_experience_link_params)

    respond_to do |format|
      if @job_experience_link.save
        format.html { redirect_to @job_experience_link, notice: 'Job experience link was successfully created.' }
        format.json { render :show, status: :created, location: @job_experience_link }
      else
        format.html { render :new }
        format.json { render json: @job_experience_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_experience_links/1
  # PATCH/PUT /job_experience_links/1.json
  def update
    respond_to do |format|
      if @job_experience_link.update(job_experience_link_params)
        format.html { redirect_to @job_experience_link, notice: 'Job experience link was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_experience_link }
      else
        format.html { render :edit }
        format.json { render json: @job_experience_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_experience_links/1
  # DELETE /job_experience_links/1.json
  def destroy
    @job_experience_link.destroy
    respond_to do |format|
      format.html { redirect_to job_experience_links_url, notice: 'Job experience link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_experience_link
      @job_experience_link = JobExperienceLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_experience_link_params
      params.require(:job_experience_link).permit(:user_id, :position_from, :position_to)
    end
end
