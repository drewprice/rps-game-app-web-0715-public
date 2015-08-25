require_relative 'config/environment'

class GameApp < Sinatra::Base
  get '/rps/:play' do
    game = RPSGame.new(params[:play].to_sym)

    @user_play     = game.user_play
    @computer_play = game.computer_play
    @result        = game.result

    erb :rps_game
  end
end
