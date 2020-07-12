# frozen_string_literal: true

class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ].freeze

  # create an array of 9 empty slots for the board
  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  # displays the current board to the user
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # changes the user input to one which matches the index of the array
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  # puts the player's move on the board
  def move(index, current_player = 'X')
    @board[index] = current_player
  end

  # checks if the square has already been used
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == ' ')
  end

  # checks that the move was valid
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  # counts each turn each player makes
  def turn_count
    turn = 0
    @board.each do |index|
      turn += 1 if index == 'X' || index == 'O'
    end
    turn
  end

  # returns the player who must make their move
  # if turn count divisible by 2 it means O just went, so X's turn
  def current_player
    num_turns = turn_count
    player = if num_turns.even?
               'X'
             else
               'O'
             end
    player
  end

  # takes the user input
  # validates the move
  # puts the move on the board
  # displays the board
  def turn
    puts "OK #{current_player}, it's your turn! Please choose a number from 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
      display_board
    else
      puts "Sorry, that move isn't allowed!"
      puts "\n"
      turn
    end
  end

  # checks the current board against all possible win combinations
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      index_0 = win_combo[0]
      index_1 = win_combo[1]
      index_2 = win_combo[2]

      position_1 = @board[index_0]
      position_2 = @board[index_1]
      position_3 = @board[index_2]

      if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
        return win_combo
      elsif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
        return win_combo
      end
    end
    false
  end

  # returns whether the board is full or not
  def full?
    @board.all? { |index| index == 'X' || index == 'O' }
  end

  # returns whether or not there has been a draw
  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  # returns whether or not the game is over
  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  # returns the winner of the game
  def winner
    index = []
    index = won?
    if index == false
      nil
    else
      if @board[index[0]] == 'X'
        'X'
      else
        'O'
      end
    end
  end

  # returns an initial welcome message
  def welcome
    puts "\n"
    puts 'Welcome to our old school CLI game of tic-tac-toe!'
    puts "\n"
    puts 'The aim of the game is to get 3 of your icon in a row'
    puts "\n"
    puts 'Player 1 will be X (crosses), and will always go first'
    puts "\n"
    puts 'Player 2 will be O (naughts), and will always go second'
    puts "\n"
    puts 'The board looks like this:'
    puts "\n"
    puts ' 1 | 2 | 3 '
    puts '-----------'
    puts ' 4 | 5 | 6 '
    puts '-----------'
    puts ' 7 | 8 | 9 '
    puts "\n"
    puts 'Simply type the number of the square where you want to make your move'
    puts "\n"
    puts 'Enjoy!'
    puts "\n"
  end

  # initiaites the game
  def play
    welcome
    turn until over? == true

    if won?
      puts "Congratulations #{winner}! You are the tic-tac-toe champion."
    elsif draw?
      puts "Oh no! It's a draw!"
    end
  end
end

game = TicTacToe.new
game.play
