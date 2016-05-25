class SnippetsController < ApplicationController

	def index
		@snippets = Snippet.all
	end

	def new
		@snippet = Snippet.new
	end

	def create
		if @user = User.find(params[:user_id])
			@snippet = @user.snippets.new(snippet_params)
			if @snippet.save
			  redirect_to snippet_path(@snippet)
			else
			  @errors = @snippet.errors.full_messages
			  render 'index'
			end
		else
			redirect_to root_path
		end
	end

	def show
		@snippet = Snippet.find_by(id: params[:id])
		@comments = @snippet.comments.sort_by{|comment| comment.created_at}.reverse
	end

	def edit
	end

	def update
	end

	def destroy
		@snippet = Snippet.find_by(id: params[:id])
		if logged_in? && current_user = @snippet.author
		  @snippet.destroy
		  redirect_to root_path
		else
		  redirect_to snippet_path(@snippet)
		end
	end

	private
  def snippet_params
    params.require(:snippet).permit(:title, :description, :category, :html, :css, :js)
  end
end
