class ColorsController < ApplicationController
	def index
		@colors = Color.all
	end

	def new
		@color = Color.new
	end

	def create
		@user = User.find(params[:user_id])
		@color = @user.colors.new(color_params)
		if @color.save
			redirect_to colors_path
		else
			@errors = @color.errors.full_messages
			render 'new'
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@color = Color.find(params[:id])
		if @user == @color.author
			@color.destroy
			redirect_to colors_path
		else
			redirect_to colors_path
		end
	end

	private
  def color_params
    params.require(:color).permit(:code)
  end
end
