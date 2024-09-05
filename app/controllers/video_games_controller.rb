class VideoGamesController < ApplicationController
  before_action :authenticate_user

  def welcome; end

  def index
    @video_games = VideoGame.all
  end

  def show
    @video_game = VideoGame.find(params[:id])
    @user = User.find(session[:user_id])
  end
end
