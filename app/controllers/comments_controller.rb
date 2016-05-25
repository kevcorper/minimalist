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
	end

	def update
	end

	def destroy
	end

	private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
