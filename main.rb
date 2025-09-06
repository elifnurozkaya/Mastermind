require_relative 'lib/game.rb'

puts "-----Welcome to the Mastermind-----"
puts "Colors in game are: Yellow, Red, Pink, Purple, Blue, Green"

game = Game.new
game.new_code

while game.finish == 0
  game.take_guess
  game.check_guess
  game.show_left_attempts unless game.left_attempts == 0
end

