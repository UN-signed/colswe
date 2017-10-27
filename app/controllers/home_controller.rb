require 'will_paginate/array'

class HomeController < ApplicationController
  def index
    projects = Project.all
    articles = Article.all
    research_groups = ResearchGroup.all
    users = User.all

    case params[:item]
      when "1"
        @items = Project.order('created_at DESC')
      when "2"
        @items = Article.order('created_at DESC')
      when "3"
        @items = ResearchGroup.order('created_at DESC')
      when "4"
        @items = User.order('created_at DESC')
      else
        @items = (articles + projects + research_groups + users)
    end

    @items = @items.paginate(page: params[:page], per_page: 8) 

    respond_to do |format|
      format.html
      format.js
    end
  end
end
