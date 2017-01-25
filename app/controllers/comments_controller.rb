class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end

	def create
		if (@user = User.find(params[:user_id])) && (@snippet = Snippet.find(params[:snippet_id]))
			@comment = @snippet.comments.new(comment_params)
			@comment.author = @user

			if @comment.save
				redirect_to snippet_path(@snippet)
			else
			  @errors = @comment.errors.full_messages
			  render 'new'
			end
		else
			redirect_to root_path
		end
	end

	def edit
		@snippet = Snippet.find(params[:snippet_id])
		@comment = Comment.find(params[:id])
	end

	def update
		@user = User.find(params[:user_id])
		@snippet = Snippet.find(params[:snippet_id])
		@comment = Comment.find(params[:id])
		if @user == @comment.author
			@comment.update_attributes(comment_params)
			if @comment.save
			  redirect_to snippet_path(@snippet)
			else
			  @errors = @comment.errors.full_messages
			  render 'edit'
			end
		else
			redirect_to snippet_path
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@snippet = Snippet.find(params[:snippet_id])
		@user = User.find(params[:user_id])
		if @user == @comment.author
		  @comment.destroy
		  redirect_to snippet_path(@snippet)
		else
		  redirect_to snippet_path(@snippet)
		end
	end

	private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
