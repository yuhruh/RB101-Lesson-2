CHOICE = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'sp' => 'spock',
  'l' => 'lizard'
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
  (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') || 
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'spock' && second == 'scissors') 
end

def display_result(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's tie")
  end
end

player_score = 0
computer_score = 0 
loop do
  player_choice = ''
  loop do
    choice_prompt = <<-MSG
    which would you like to choose?
	   r for rock
	   p for paper
	   l for lizard
	   sc for scissors
	   sp for spock
	   MSG
	
    prompt("#{choice_prompt}")
    player_choice = Kernel.gets.chomp

    
    if CHOICE.keys.include?(player_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = CHOICE.values.sample
  Kernel.puts("You chose: #{CHOICE[player_choice]}; computer chose: #{computer_choice}")

  Kernel.puts("Current your score is #{player_score}")
  Kernel.puts("Current computer's score is #{computer_score}")
  display_result(CHOICE[player_choice], computer_choice)
  
  if win?(CHOICE[player_choice], computer_choice)
    player_score += 1
    prompt("Your score is #{player_score}")
    prompt('You are the grand winner!') if player_score == 5
  elsif win?(computer_choice, CHOICE[player_choice])
    computer_score += 1
    prompt("Computer's score is #{computer_score}")
    prompt('OH! Computer is the grand winner!!') if computer_score == 5
  else
    prompt('No one scored!')
  end
  
  prompt('Do you want to play again?')
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing.Good bye!')
