require_relative 'lib/game.rb'
play = 1
while(play == 1)
  puts "-----Welcome to the Mastermind-----"
  puts "Colors in game are: Yellow, Red, Pink, Purple, Blue, Green"

  game = Game.new
  game.new_code

  while game.finish == 0
    game.take_guess
    game.check_guess
    game.show_left_attempts unless game.left_attempts == 0
  end

  while(true)
  puts "Another round?(y/n)"
  choice = gets.chomp.downcase
  if  choice == 'n'
    play = 0
    break
  elsif choice == "y"
    break
  else
    puts "What is even that mean??"
  end
end
end
