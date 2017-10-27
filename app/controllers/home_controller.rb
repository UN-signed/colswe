require 'will_paginate/array'

class HomeController < ApplicationController
  def index
    case params[:item]
      when "1"
        @items = Project.order('created_at DESC').paginate(page: params[:page], per_page: 6)
      when "2"
        @items = Article.order('created_at DESC').paginate(page: params[:page], per_page: 6)
      when "3"
        @items = ResearchGroup.order('created_at DESC').paginate(page: params[:page], per_page: 6)
      when "4"
        @items = User.order('created_at DESC').paginate(page: params[:page], per_page: 6)
      else
        projects = Project.all
        articles = Article.all
        research_groups = ResearchGroup.all
        users = User.all
        @items = (articles + projects + research_groups + users).paginate(page: params[:page], per_page: 6)
    end

    @items = @items.paginate(page: params[:page], per_page: 8) 

    respond_to do |format|
      format.html
      format.js
    end
  end
end
