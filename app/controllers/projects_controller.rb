class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]    #, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.load_projects(research_group_id: params[:research_group_id], page: params[:page])
    # @projects = Project.where(research_group_id: params[:research_group_id]).paginate(page: params[:page], per_page: 12)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @group = ResearchGroup.find(@project.research_group_id)
    puts
    respond_to do |format|
      format.html
      format.pdf{render template: "projects/pdf", pdf: "pdf"}
    end
  end

  # GET /projects/new
  def new
    @states = ["Activo", "Pendiente", "Rechazado", "Terminado"]
    @project = Project.new
    @group = ResearchGroup.find(params[:research_group_id])
  end

  # GET /projects/1/edit
  def edit
    @states = ["Activo", "Pendiente", "Rechazado", "Terminado"]
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    puts @project.research_group_id
    respond_to do |format|
      if @project.save
        params[:project][:user_id].each do |x|
          if x != ""
            m = Member.new
            m.project_id = @project.id
            m.research_group_id = @project.research_group_id
            m.user_id = x
            m.save!
          end
        end
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end

    @member = Member.create(
      role: "Lider",
      user_id: current_user.id,
      research_group_id: @project.research_group_id,
      project_id: @project.id
    )
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update(project_params)
        params[:project][:user_id].each do |x|
          if x != "" and not Member.find_by project_id: @project.id, research_group_id: params[:project][:research_group_id], user_id: x
            m = Member.new
            m.project_id = @project.id
            m.research_group_id = @project.research_group_id
            m.user_id = x
            m.save!
          end
        end
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    group = ResearchGroup.find(@project.research_group_id)
    members = Member.where(:project_id => params[:id])
    members.each do |m|
      Member.destroy(m.id)
    end
    @project.destroy
    respond_to do |format|
      format.html { redirect_to research_group_url(group), notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :state, :summary, :git).merge(research_group_id: params[:research_group_id])
    end
end
