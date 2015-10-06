require "pry"
require "set"

##HOMEWORK - Support 2 players
##Track name for both players (name input)
##Track guesses for each player separately  -  change logic to accept both sets of guesses OR 
##create conditional to track which player is playing when   -  probably put into hangman 
##ex in hangman push player1 and player 2 and then define (will be a conditional) that can switch from player 1 to player 2
##current_player = player 1
##Current guesses = p1_guesses
##postmortem update to pass along who wins (current_player)

MAX_TURNS = 6


fucking_quitter = ["no", "nope", "fuck this shit", "peace", "I'm out", "0", "n", "nah", "np", "ni", "this is stupid", "lol", "I hate this", "I hate you", "I deplore violence"]


def greeting
	puts "Welcome to the game of Hangman!  Where guessing letters is as fun as capital punishment!"
end

def gameover?(guesses, answer)
	turns_left(guesses, answer) == 0 || win?(answer, guesses) == true
end

def show_progress(partial_word, answer, guesses)
  turns_remaining = turns_left(guesses, answer)
  puts
  puts "The current word is: #{partial_word}"
  puts "You have #{turns_remaining} guesses left."
end

def prompt_player(current_player)
	puts "\nIt's your turn #{current_player}!"
	puts "\nPlease guess a letter: "
	letter = gets.chomp.downcase

	until ('a'..'z').to_a.include?(letter) || letter == " "
		puts "This time try to guess an actual letter!  Guess again!"
		letter = gets.chomp.downcase
	end
	letter
end

def make_partial(guesses, answer)
  #blank an answer if it isn't in the guesses
  answer.chars.map do |letter|
  	if guesses.include?(letter.downcase)
  		letter
  	else
  		"_"
  	end
  end
end

def take_turn(guesses, answer, current_player)
	partial_word = make_partial(guesses, answer)
	show_progress(partial_word.join, answer, guesses)
	prompt_player(current_player)
end

def win?(answer, guesses)
	answer.chars.all? do |letter|
	  guesses.include?(letter.downcase)
	  ## This is a cleaner way to write the code below

	#winner = true
	#answer.chars.each do |letter|
	  #winner = false unless guesses.include?(letter)
	#end
	#winner
  end
end

def postmortem(answer, guesses, current_player)
	if win?(answer, guesses)
		puts "\n #{current_player} WOOT!  #{answer} is right!  You can guess the letters in #{answer}!  Good on you!"
	else
		puts "The word was #{answer}.  Whoops!"
	end
end

def turns_left(guesses, answer)
	answer_set = answer.downcase.chars.to_set
	wrong_guesses = guesses.difference(answer_set).count
	MAX_TURNS - wrong_guesses
end

def get_name(player)
	puts "#{player} what is your name?"
	gets.chomp
end

# def switch_players(current_player, player1, player2)
# 	if current_player == player1
# 		current_player = player2
# 	elsif current_player == player2
# 		current_player = player1
# 	end
# 	current_player
# end

def hangman(answer)
	guesses1 = Set.new
	guesses2 = Set.new
	greeting
	player1 = get_name("Player 1")
	player2 = get_name("Player 2")
	current_player = player1
	current_guesses = guesses1
	until gameover?(current_guesses, answer)
		guess = take_turn(current_guesses, answer, current_player)
		current_guesses.add(guess)
		#ternary operator
		current_player = current_player == player1 ? player2 : player1
		# current_player = switch_players(current_player, player1, player2)
		current_guesses = current_guesses == guesses1 ? guesses2 : guesses1
	end
	current_player = current_player == player1 ? player2 : player1
	# current_player = switch_players(current_player, player1, player2)
	postmortem(answer, current_guesses, current_player)
end	

	word_list = [
	"Chicago", "George Washington", "Kenny Loggins", "Lionel Ritchie", "Handsome B Wonderful", "Homer Jay Simpson", "Barack Obama", "Metallica", "ZZ Top", "Atlanta", "Jack Herer", "Twisted Sister", "Donnie Yen", "Mike Leech", "DJ Jazzy Jeff", "James Brown", "Al Capone", "Elliot Ness", "Bigfoot", "Robert Frost", "Brit Butler", "Jim Carey", "Fire Marshall Bill", 
	]	
def play(fucking_quitter, word_list)
	playagain = true
	until fucking_quitter.include?(playagain)

		answer = word_list.sample


		hangman(answer)
		
		puts "\nGot another one in ya'?"

	    playagain = gets.chomp.downcase
	end
end

play(fucking_quitter, word_list)