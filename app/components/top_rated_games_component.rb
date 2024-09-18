# frozen_string_literal: true

class TopRatedGamesComponent < ViewComponent::Base
  attr_reader :games

  def initialize(games:)
    super
    @games = games
  end
end
