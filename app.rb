require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)
# reste à indiquer les require sans précision du chemin
require 'player'
require 'game'
require 'board'
require 'boardcase'
require 'show'

def perform
  #Incrémentation d'une variable pour continuer à jouer
  wanna_play = true
  while wanna_play == true
  my_game = Game.new
    while my_game.is_still_ongoing? == true
      my_game.menu
      my_game.menu_choice
    end
  wanna_play = my_game.restart?
  end
end

perform