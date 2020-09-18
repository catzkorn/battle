require "sinatra"
require_relative "./lib/player.rb"
require_relative "./lib/game.rb"

class Battle < Sinatra::Base
  enable :sessions

  get "/" do
    erb :index
  end

  post "/names" do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect "/play"
  end

  get "/play" do
    erb :play
  end

  get "/attack" do
    $game.attack($game.player_two)
    erb :attack
  end

  run! if app_file == $0
end
