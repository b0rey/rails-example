class PagesController < ApplicationController
  include ApplicationHelper
  include PagesHelper

  # Показать узел и дочерние элементы
  def show
    @page = current_page
    @children = @page.children
  end

  # Создать новый узел
  def new
    @page = Page.new
  end

  # Редактировать узел
  def edit
    @page = current_page
  end

  # Создать узел и перейти на него
  def create
    @page = Page.new(page_params)
    @page.parent = current_page

    if @page.save then
      redirect_to @page.path
    else
      render 'new'
    end
  end

  # Обновить узел и перейти на него
  def update
    @page = current_page

    if @page.update(page_params) then
      redirect_to @page.path
    else
      render 'edit'
    end
  end

  # Уничтожить узел и перейти к родителю
  def destroy
    page = current_page
    path = page.root? ? '/' : page.parent.path
    page.destroy
    redirect_to path
  end
end
