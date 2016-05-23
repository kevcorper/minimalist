class SnippetsController < ApplicationController
	def new
		@snippet = Snippet.new
	end

	def create
		@snippet = Snippet.new(snippet_params)
		if @snippet.save
		  session[:user_id] = @user.id
		  redirect_to snippet_path(@snippet)
		else
		  @errors = @snippet.errors.full_messages
		  render 'new'
		end
	end

	def show
		@snippet = Snippet.find_by(id: params[:id])
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
    params.require(:snippet).permit(:title, :description, :category, :html, :css)
  end
end
