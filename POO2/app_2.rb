require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Display a welcome message
print "-" * 49
print"\n|Bienvenue sur 'ILS VEULENT TOUS MA POO' !|" + " " * 5 + "|"
print "\n|Le but du jeu est d'être le dernier survivant !|" + "\n" + "-" * 49
puts

puts"Quel est ton nom jeune guerrier?"
warrior = gets.chomp
user = HumanPlayer.new(warrior)
player1 = Player.new("Léodagan de Carmélide")
player2 = Player.new("Perceval de Galles")
ennemies = [player1, player2]


def display_menu(user, player1, player2)
    puts"#{user.show_states}"
    puts"Que veux-tu faire #{user.name} ?"
    
    puts"c - Chercher Escalimbur"
    puts"s - Chercher une potion de guérison des plaies"
    puts"Attaquer sauvagement"
    puts"1 - Léodagan de Carmélide"
    puts"2 - Perceval de Galles"
    puts "Voici l'état de vos adversaires :"
    puts player1.show_states
    puts player2.show_states

    enter = gets.chomp
    if enter == "c"
        user.search_weapon
    elsif enter == "s"
        user.search_health_pack
    elsif enter == "1"
        user.attacks(player1)
    elsif enter == "2"
        user.attacks(player2)
    else
        puts "--------------------------------"
        puts "Vous vous trompez de touche, et du coup la forme sporadique du fenouille n'est pas très efficace..."
        puts "--------------------------------"
    end
end

while user.life_points > 0 && player1.life_points > 0 || player2.life_points > 0
  # Display action menu
  display_menu(user, player1, player2)

    
  
  ennemies.each do |player|
        if player.life_points >= 0
            puts "MECREAAAAAAANT!!!"
            puts "Tu te fais attaquer"
            player.attacks(user)
        end
    end
end
puts "Partie terminée"
    if user.life_points>0
        puts "Bravo #{warrior}, tu viens de terrasser ces deux grosses tatas!!!"
    else
        puts "Tu as perdu !"
    end