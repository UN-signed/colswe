require 'will_paginate/array'

class HomeController < ApplicationController
  def index
    case params[:item]
      when "1"
        @items = Project.order('created_at DESC')
      when "2"
        @items = Article.order('created_at DESC')
      when "3"
        @items = ResearchGroup.order('created_at DESC')
      when "4"
        @items = Member.select(:user_id).order('created_at DESC')
      else
        @items = Article.order('created_at DESC')
        @items += Project.order('created_at DESC')
        @items += ResearchGroup.order('created_at DESC')
        @items += User.order('created_at DESC')
    end

    @items = @items.paginate(page: params[:page], per_page: 8)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
