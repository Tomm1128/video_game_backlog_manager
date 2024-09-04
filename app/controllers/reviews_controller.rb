class ReviewsController < ApplicationController
  before_action :set_video_game
  before_action :authenticate_user
  def new
    @review = Review.new
  end

  def create
    @review = @video_game.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @video_game, notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def set_video_game
    @video_game = VideoGame.find(params[:video_game_id])
  end

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end
end
