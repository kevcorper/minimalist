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
			  render 'new'
			end
		else
			redirect_to root_path
		end
	end

	def show
		@snippet = Snippet.find(params[:id])
		@comments = @snippet.comments
	end

	def edit
		@snippet = Snippet.find(params[:id])
		@user = User.find(params[:user_id])
	end

	def update
		@snippet = Snippet.find(params[:id])
		@user = User.find(params[:user_id])
		if @snippet.author == @user
			@snippet.update_attributes(snippet_params)
			if @snippet.save
			  redirect_to snippet_path(@snippet)
			else
			  @errors = @snippet.errors.full_messages
			  render 'edit'
			end
		else
			redirect_to snippet_path(@snippet)
		end
	end

	def destroy
		@snippet = Snippet.find(params[:id])
		@user = User.find(params[:user_id])
		if @user = @snippet.author
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
