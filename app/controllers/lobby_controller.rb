class LobbyController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'application'

  def index
    @player_exists = session[:player_id].present?
    respond_to :html
  end

  def create_player
    if name = params.require(:name)
      player = Player.create(name: name)
      debugger
    else

    end
  end
end
