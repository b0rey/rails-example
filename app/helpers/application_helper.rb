module ApplicationHelper

  # URL путь текущей страницы
  # return: string
  def page_path
    '/' + params[:path]
  end

  # Значения входныйх данных
  # return: name, title, text
  def page_params
    params.require(:page).permit(:name, :title, :text)
  end
end
