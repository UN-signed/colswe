class Users::UsersController < ApplicationController
  def show
    @user = User.searchById(params[:id])
    @message = Message.new
    @messages = Message.getUserMessages(@user.id)
    @research_groups = []
    admin_research_groups = ResearchGroup.admin_research_groups(@user.id)
    admin_research_groups.each do |g|
      @research_groups.push(ResearchGroup.searchById(g.id))
    end
    research_groups = Member.research_groups(@user.id)
    research_groups.each do |m|
      g = ResearchGroup.searchById(m.research_group_id)
      unless @research_groups.include?(g)
        @research_groups.push(g)
      end
    end
    @projects = []
    projects = Member.projectsIds(@user.id)
    projects.each do |m|
      unless m.project_id.nil?
        @projects.push(Project.searchById(m.project_id))
      end
    end
  end

  def show_message
    @message = Message.find(params[:md]).message
    respond_to do |format|
      format.js
    end
  end
end
