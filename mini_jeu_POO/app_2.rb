
# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
#require 'pry'
require 'time'
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/player.rb et lib/game.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/game'
require_relative 'lib/player'




puts "..............................................."
puts "|Bienvenue sur mon Jeu de POO !!!              |"
puts "Le but du jeu est d'être le dernier survivant..."
puts "..............................................."


puts "quel est ton prénom" #on récupère le  prénom  de la personne
firstname_user = gets.chomp

user = HumanPlayer.new(firstname_user)
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [ player1, player2 ] #on créer le tableau des ennemis




####On simule le combat
while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
 user.show_state

puts "Quelle action veux-tu effectuer? "
puts "---------------------------------"
puts "a- chercher une meilleure arme---"
puts "b- chercher à se soigner---------"
puts "---------------------------------\n"
player1.show_state
player2.show_state
 



choice = gets.chomp #pour faire le choix

  case choice
  when 'a'
    user.search_weapon

  when 'b'
    user.search_health_pack

  when '0'
    user.attacks(player1)

  when '1'
  user.attacks(player2)

  end

puts"----------------------------------------------------------"
puts "Les autres joueurs t'attaquent !"

enemies.each do |enemy|
  		if enemy.life_points > 0 
  			enemy.attacks(user) 
  		end 
end


 binding.pry  #la commande pour tester dans la boucle


end #fin du while 

