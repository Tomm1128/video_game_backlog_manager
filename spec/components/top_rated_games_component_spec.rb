require "rails_helper"

RSpec.describe TopRatedGamesComponent, type: :component do
  include Rails.application.routes.url_helpers

  let(:games) do
    [
      instance_double("Game", name: "The Witcher 3", average_rating: 4.9, id: 1),
      instance_double("Game", name: "Cyberpunk 2077", average_rating: 3.7, id: 2),
      instance_double("Game", name: "Red Dead Redemption 2", average_rating: 4.8, id: 3)
    ]
  end

  it "renders multiple game cards" do
    render_inline(described_class.new(games: games))

    expect(page).to have_css(".card-title", text: "The Witcher 3")
    expect(page).to have_css(".card-title", text: "Cyberpunk 2077")
    expect(page).to have_css(".card-title", text: "Red Dead Redemption 2")

    expect(page).to have_css(".card-text", text: "Average Rating: 4.9")
    expect(page).to have_css(".card-text", text: "Average Rating: 3.7")
    expect(page).to have_css(".card-text", text: "Average Rating: 4.8")
  end

  it "renders links to view each game" do
  render_inline(described_class.new(games: games))

  expect(page).to have_link("View Game", href: video_game_path(1))
  expect(page).to have_link("View Game", href: video_game_path(2))
  expect(page).to have_link("View Game", href: video_game_path(3))
end

  it "renders the correct number of game cards" do
    render_inline(described_class.new(games: games))

    expect(page).to have_css(".card", count: 3)
  end
end
