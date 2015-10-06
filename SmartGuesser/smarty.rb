require "pry"
class Smartypants
	def initialize
		@guess = 50
		@min = 1
		@max = 100
	end

	def get_guess(help, last_guess)
		if help == 0   #intitial guess
			@guess
		elsif help == "Low"   #guess TOO LOW
			@min = last_guess
			(@min + @max) / 2
#####			if last_guess == guess
#####				guess +1
		else ##help == TOO HIGH
			@max = last_guess
			(@min + @max) / 2
			#in which case last_guess + 1
		end	
	end
end
##guess = @player.get_guess(help, range)
##count += 1
#      if help == 1
#       range = (guess..100)
#      else
#        range = (1..guess)
#    end


####  comments above this line reflect the fragile state of my mind on Ironyard
####  just say no to Ironyards!