class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    # @completed_games = @user.collections.where(type: "Completed").video_games
    @completed_games = @user.collection_by_type("Completed")
    @in_progress_games = @user.collection_by_type("In-Progress")
    @wishlist_games = @user.collection_by_type("Wishlist")
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :bio)
  end
end
