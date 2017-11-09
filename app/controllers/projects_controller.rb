class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]    #, :edit, :update, :destroy]

  def index
    @projects = Project.load_projects(research_group_id: params[:research_group_id], page: params[:page])
  end

  def show
    @project = Project.find(params[:id])
    @members = Project.getMembers(@project.id)#Member.select(:id, :user_id).where(project_id: @project.id)
    @group = ResearchGroup.find(@project.research_group_id)
    @user = User.find(current_user.id)
    @subscriber = true
    if Subscriber.where(:project_id => params[:id], :user_id => current_user.id).blank?
      @subscriber = false
    end
    @data = Array.new(2)
    @data[0] = Member.vsTime(Rails.env.development? ? "date( created_at)" : "to_char(created_at, 'YYYY-MM-DD')",@project.id)
    @data[1] = Project.getMembersDegree(@project.id)
    respond_to do |format|
      format.html
      format.pdf{render template: "projects/pdf", pdf: "pdf"}
    end
  end

  def new
    @states = ["Activo", "Pendiente", "Rechazado", "Terminado"]
    @project = Project.new
    @group = ResearchGroup.find(params[:research_group_id])
  end

  def edit
    @states = ["Activo", "Pendiente", "Rechazado", "Terminado"]
    @project = Project.find(params[:id])
  end

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
        format.html { redirect_to @project, notice: 'El projecto de actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    group = ResearchGroup.find(@project.research_group_id)
    members = Member.where(:project_id => params[:id])
    members.each do |m|
      Member.destroy(m.id)
    end
    @project.destroy
    respond_to do |format|
      format.html { redirect_to research_group_url(group), notice: 'El proyecto se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :state, :summary, :git).merge(research_group_id: params[:research_group_id])
    end
end
