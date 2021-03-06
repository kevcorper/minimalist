class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(snippet_params)
    if @user.save
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render 'edit'
    end
  end

  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
      if @user === current_user
        @snippets = @user.snippets
        @favorites = @user.favorites
        @commented = @user.comments.map {|comment| comment.snippet}
        render 'show'
      else
        redirect_to snippets_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if logged_in? && current_user = @user
      @user.destroy
      redirect_to root_path
    else
      redirect_to user_path(@user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end