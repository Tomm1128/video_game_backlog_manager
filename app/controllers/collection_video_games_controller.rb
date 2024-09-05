class CollectionVideoGamesController < ApplicationController
  before_action :authenticate_user
  before_action :set_user

  def new
    @collection_video_game = CollectionVideoGame.new
    @video_game = VideoGame.new
    @video_games = VideoGame.all
  end

  def create
    @video_game = find_or_create_video_game

    @collection = Collection.find_or_create_by(user_id: @user.id,
                                               collection_type: collection_video_game_params[:collection_type])
    @collection_video_game = @collection.collection_video_games.build(video_game: @video_game,
                                                                      playtime: collection_video_game_params[:playtime])
    if @collection_video_game.save
      redirect_to user_path(@user), notice: "Video game added to collection."
    else
      @video_games = VideoGame.all
      render :new
    end
  end

private

  def collection_video_game_params
    params.require(:collection_video_game).permit(:playtime, :collection_type, :video_game_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def find_or_create_video_game
    if collection_video_game_params[:video_game_id].present?
      VideoGame.find(collection_video_game_params[:video_game_id])
    else
      video_game = VideoGame.new(video_game_params)
      video_game.save ? video_game : nil
    end
  end

  def video_game_params
    params.require(:video_game).permit(:name, :description, :release_date, :developer, :publisher, :platform)
  end
end
