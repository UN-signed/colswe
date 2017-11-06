require 'will_paginate/array'

class HomeController < ApplicationController
  def index
    @items = Article.search(params[:searchbox])
    @items += Project.search(params[:searchbox])
    @items += ResearchGroup.search(params[:searchbox])

    # @items.sort! { |a,b| a.name.downcase <=> b.name.downcase }
    @items.sort! { |a,b| a.created_at <=> b.created_at }
    @items = @items.reverse.paginate(page: params[:page], per_page: 16)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
