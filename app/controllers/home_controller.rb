class HomeController < ApplicationController
  def index
    @projects = Project.all.paginate(page: params[:page], per_page: 12)
  end
end
