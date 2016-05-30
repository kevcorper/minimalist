class FavoritesController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		if @user
			@snippet = Snippet.find(params[:snippet_id])
			@favorite = @user.favorites.push(@snippet)
			redirect_to snippet_path(@snippet)
		else
			redirect_to snippet_path(@snippet)
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@snippet = Snippet.find(params[:snippet_id])
		@user.favorites.delete(@snippet)
		redirect_to snippet_path(@snippet)
	end
end