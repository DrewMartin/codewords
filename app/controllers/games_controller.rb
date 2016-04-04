class GamesController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'application'

  before_action :ensure_session

  def show
    # DEBUG
    Game.destroy_all

    # Create a new game if none exists
    if Game.all.empty?
      @game = Game.create

      # Create cards
      words = ["APPLE", "TREE", "BUTTERFLY", "LAKE", "BOMB", "DOLPHIN"].shuffle
      owners = [:red,:blue,:neutral,:neutral,:trap].shuffle

      for i in (1..25)
        card = Card.new
        card.game = @game
        card.word = words[(i - 1) % words.length]
        card.owner = owners[(i - 1) % owners.length]
        card.revealed = false
        card.save
      end
    else
      @game = Game.find(1)
    end

  end

  private

  def ensure_session
    redirect_to(root_path) unless session[:player_id]
  end
end
