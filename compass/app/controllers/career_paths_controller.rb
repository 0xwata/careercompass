class CareerPathsController < ApplicationController
  before_action :set_career_path, only: [:show, :edit, :update, :destroy]

    def search
    end

  # GET /career_paths
  # GET /career_paths.json
    def index
        #Viewのformで取得したパラメータをモデルに渡す company_fromについて
        if params[:search_from].present?
            @start_company = params[:search_from]
            from_id = Company.search_id_from_company_name(params[:search_from]).id
        end
        if params[:search_to].present?
            to_id = Company.search_id_from_company_name(params[:search_to]).id
            @goal_company = params[:search_to]
        end
        p from_id
        p to_id 
        
        
        if from_id.present? or to_id.present?
            @search_career_paths = CareerPath.execute_search(from_id, to_id)
            p @search_career_paths
            @search_career_paths_json = @search_career_paths.to_json.html_safe
            @search_career_paths.each do |career_path|
                p "#{career_path['user_id']}:#{career_path['from_career']}→#{career_path['to_career']}"
                puts ''
            end
        else
            @search_career_paths = CareerPath.all
            @search_career_paths.each do |career_path|
                p "#{career_path['user_id']}:#{career_path['from_career']}→#{career_path['to_career']}"
                puts ''
            end
        end
    end

  # GET /career_paths/1
  # GET /career_paths/1.json
  def show
  end

  # GET /career_paths/new
  def new
    @career_path = CareerPath.new
  end

  # GET /career_paths/1/edit
  def edit
  end

  # POST /career_paths
  # POST /career_paths.json
  def create
    @career_path = CareerPath.new(career_path_params)

    respond_to do |format|
      if @career_path.save
        format.html { redirect_to @career_path, notice: 'Career path was successfully created.' }
        format.json { render :show, status: :created, location: @career_path }
      else
        format.html { render :new }
        format.json { render json: @career_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /career_paths/1
  # PATCH/PUT /career_paths/1.json
  def update
    respond_to do |format|
      if @career_path.update(career_path_params)
        format.html { redirect_to @career_path, notice: 'Career path was successfully updated.' }
        format.json { render :show, status: :ok, location: @career_path }
      else
        format.html { render :edit }
        format.json { render json: @career_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /career_paths/1
  # DELETE /career_paths/1.json
  def destroy
    @career_path.destroy
    respond_to do |format|
      format.html { redirect_to career_paths_url, notice: 'Career path was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_career_path
      @career_path = CareerPath.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def career_path_params
      params.require(:career_path).permit(:user_id, :from_career, :to_career)
    end
end
