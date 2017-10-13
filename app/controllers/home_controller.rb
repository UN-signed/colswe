require 'will_paginate/array'

class HomeController < ApplicationController
  def index
    @projects = Project.paginate(page: params[:project_page], per_page: 6)
    @articles = Article.paginate(page: params[:article_page], per_page: 6)
    #@projectsAndArticles = (@projects + @articles).paginate(page: params[:page], per_page: 6)
  end
end
