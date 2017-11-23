require 'will_paginate/array'

class HomeController < ApplicationController
  def index
    case params[:category]
      when "Artículos"
        @items = Article.search(params[:searchbox])
      when "Proyectos"
        @items = Project.search(params[:searchbox])
      when "Grupos"
        @items = ResearchGroup.search(params[:searchbox])
      else
        @items = Article.search(params[:searchbox])
        @items += Project.search(params[:searchbox])
        @items += ResearchGroup.search(params[:searchbox])
    end

    @results = @items.length

    # @items.sort! { |a,b| a.name.downcase <=> b.name.downcase }
    @items = @items.sort { |a,b| a.created_at <=> b.created_at }
    @items = @items.reverse.paginate(page: params[:page], per_page: 32)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def contact
    # Aquí va lo que hace el boton "contacto" del home
  end
end
