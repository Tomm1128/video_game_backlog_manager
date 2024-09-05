class VideoGamesController < ApplicationController
  before_action :authenticate_user

  def welcome
    @top_rated_video_games = VideoGame.all.sort_by(&:average_rating).reverse.first(3)
  end

  def index
    @video_games = VideoGame.all.sort_by(&:average_rating).reverse
  end

  def show
    @video_game = VideoGame.find(params[:id])
    @user = User.find(session[:user_id])
  end
end
