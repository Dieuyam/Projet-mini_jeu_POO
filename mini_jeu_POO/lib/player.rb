
require "pry"

class Player #début de la classe Player

attr_accessor :name, :life_points


#


	def initialize(name_gamer)  #Constructeur
			@name=name_gamer
			@life_points=10
	end


	def show_state  #cette méthode affiche les points de vie
	puts "#{@name} a #{@life_points} points de vie"


	end 

	def gets_damage (damage) #cette méthode retire les points de vie
			 @life_points = @life_points - damage 
			 puts "le joueur #{@name} a été tué !"  if @life_points <= 0
	end

		


	def attacks (player_attacked)  #cette méthode simule l'attaque d'un joueur sur un autre

		damage= compute_damage
		puts "#{@name} attaque #{player_attacked.name}"
		puts "il lui inflige #{damage} points de dommage"
		player_attacked.gets_damage(damage)

	end


	def compute_damage
	    return rand(1..6)
	end



end #fin de la classe Player




class HumanPlayer < Player   # la classe Fille Human de Player avec ses partircularités

	 attr_accessor :weapon_level

	  def initialize(name_gamer)
	  	@name=name_gamer
	    @weapon_level = 1# j'ai rajouté cette ligne
	    @life_points=100

	  end

	def show_state  # la fonction d'affichage de l'état propre à la classe HumanPlayer
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"

	end 


	def compute_damage
    	rand(1..6) * @weapon_level
 	 end


 	def search_weapon  #la méthode de recherche d'armes
 		weapon_found= rand(1..6)
 		puts "Tu as trouvé une arme de nivau #{weapon_found}"

 		puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends!"  if weapon_found > @weapon_level
 		puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."  if weapon_found <= @weapon_level
 		
 	end



 	def search_health_pack  #la méthode de recherche de pack de vie
 		life_found= rand(1..6)
 		#puts "Tu as trouvé une arme de nivau #{life_found}"

 		puts "Tu n'as rien trouvé... " if  life_found == 1
 	
 		if life_found >=2 && life_found <=5  && life_points <=50
 					@life_points= @life_points +50
 					puts "Bravo, tu as trouvé un pack de +50 points de vie !"  

 	    elsif life_found ==6   && life_points <=20			
 	    			@life_points= @life_points + 80
 	    		puts "Bravo, tu as trouvé un pack de +80 points de vie !" 

 	    else @life_points=100
 	    end  
 	    
 	 
	
	end  #fin de la classe HumanPlayer





  
 
end
puts "end of file"
