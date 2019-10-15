# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
#require 'pry'
require 'time'
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/player.rb et lib/game.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/game'
require_relative 'lib/player'




 player1 = Player.new("Josiane") #premère instance de la classe Player
 player2 = Player.new("José") #Deuxième instance de la classe Player
 player1.name #On affiche le nom de la première instance
 player1.life_points #On affiche les points de la vie de la deuxième instance
 
 #player1.gets_damage(5)
  
 
puts "Voici l'état de chaque joueur"
 player1.show_state
 player2.show_state
puts "---------------------------"




while player1.life_points > 0 && player2.life_points >0  ##On commance la simutation de combat :-)

puts "Passons à la phase d'attaque"
 player1.attacks(player2)
 	break if player2.life_points <=0 
 player2.attacks(player1)

puts "---------------------------"
end
 binding.pry

player3 = HumanPlayer.new("Tarzan")

player3.search_weapon #on teste la méthode de recherche d'arme
player3.search_health_pack #on teste la méthode de recherche de pack de vie