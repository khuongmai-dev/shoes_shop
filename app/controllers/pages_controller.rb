class PagesController < ApplicationController
  def index

  end
  def show
    @page = Page.find_by(permalink: params[:permalink])
  end
end
