class IframesController < ApplicationController
	def index
		@snippet = @snippet = Snippet.find(params[:snippet_id])
		render 'index', layout: false
	end
end