require_relative 'lib/tic_tac_toe'

game = TicTacToe.new
game.welcome

continue = 'c'
while continue
  puts('Press c to continue, or q to quit the game')
  continue = gets.chomp
  case continue
  when 'c'
    game = TicTacToe.new
    game.welcome
    game.play
  when 'q'
    exit
  else
    puts("Please enter a valid choice.\n ")
  end
end
