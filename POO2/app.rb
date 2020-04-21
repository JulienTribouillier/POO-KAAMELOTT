require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

player1 = Player.new("Arthur")
player2 = Player.new("Léodagan")

#binding.pry

while (player1.life_points > 0) && (player2.life_points>0)
  
  puts "Voici l'état de vos joueurs :"
  puts player1.show_states
  puts player2.show_states
  puts player1.attacks(player2)
  puts player2.attacks(player1)
  player2.life_points <= 0
    break
  end

end
