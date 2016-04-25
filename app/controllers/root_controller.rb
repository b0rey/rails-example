class RootController < ApplicationController
  include ApplicationHelper

  # Показать дочерние элементы
  def index
    @children = Page.roots
  end

  # Создать новый узел
  def new
    @page = Page.new
  end

  # Создать узел и перейти на него
  def create
    @page = Page.new(page_params)
    if @page.save then
      redirect_to @page.path
    else
      render 'new'
    end
  end
end
