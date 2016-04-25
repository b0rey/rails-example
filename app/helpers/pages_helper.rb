module PagesHelper

	# Текущая страница
	# return: Page || nil
	def current_page
		children = Page.roots
		node = nil
		path = params[:path]

		path && path.split('/').each { |name|
			node = children.where(:name => name)[0]
			if node.nil? then not_found end
			children = node.children
		}

		return node
	end

	# Путь до родительского узла
	def parrent_page_path(page)
		page.root? ? '/' : page.parent.path
	end

	# Путь до узла редактирования
	def edit_page_path(page)
		@page.path + '/edit'
	end

	# Путь до добавления нового узла
	def new_page_path(page)
		@page.path + '/add'
	end

	# Путь до удаления узла
	def del_page_path(page)
		@page.path
	end

	# 404
	def not_found
		raise ActionController::RoutingError.new('Not Found')
	end
end
