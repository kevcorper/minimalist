class CategoriesController < ApplicationController
	def show
		@category = params[:id]
		@snippets = Snippet.all.select{|snippet| snippet.category == params[:id]}
	end
end