require 'will_paginate/array'

class HomeController < ApplicationController
  def index
    @projects = Project.all#.paginate(page: params[:project_page], per_page: 6)
    @articles = Article.all#paginate(page: params[:article_page], per_page: 6)
    @research_groups = ResearchGroup.all#paginate(page: params[:article_page], per_page: 6)
    @users = User.all#paginate(page: params[:article_page], per_page: 6)
    @items = (@articles + @projects).paginate(page: params[:page], per_page: 6)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
