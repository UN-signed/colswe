class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @research_groups = []
    admin_research_groups = ResearchGroup.select(:id).where(administrator_id: @user)
    admin_research_groups.each do |g|
      @research_groups.push(ResearchGroup.find(g.id))
    end
    research_groups = Member.select(:research_group_id).where(user_id: @user).distinct
    research_groups.each do |m|
      g = ResearchGroup.find(m.research_group_id)
      unless @research_groups.include?(g)
        @research_groups.push(g)
      end
    end
    @projects = []
    projects = Member.select(:project_id).where(user_id: params[:id]).distinct
    projects.each do |m|
      @projects.push(Project.find(m.project_id))
    end
  end
end
