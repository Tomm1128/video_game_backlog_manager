class VideoGamesController < ApplicationController
  before_action :authenticate_user

  def welcome
    @top_rated_video_games = VideoGame.top_rated.limit(3)
  end

  def index
    @video_games = VideoGame.top_rated
  end

  def show
    @video_game = VideoGame.find(params[:id])
    @user = User.find(session[:user_id])
  end
end
