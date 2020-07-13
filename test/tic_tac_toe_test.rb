# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/tic_tac_toe'

class TicTacToeTest < Minitest::Test
  def test_that_board_has_9_squares
    game = TicTacToe.new
    assert_equal [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], game.board
  end

  def test_that_board_with_2_x_and_2_o_is_valid
    game = TicTacToe.new(['X', 'X', ' ', 'O', ' ', 'O', ' ', ' ', ' '])
    assert_equal "X", game.current_player
  end

  def test_that__board_with_one_x_and_3_os_is_invalid
    game = TicTacToe.new(['X', 'X', ' ', 'O', 'X', ' ', ' ', ' ', 'O'])
    assert_equal "O", game.current_player
  end

  def test_that_3_in_a_row_horizontal_is_a_win
    game = TicTacToe.new(['X', 'X', 'X', ' ', 'O', 'O', ' ', ' ', 'O'])
    assert_equal "X", game.won?
  end

  def test_that_3_in_a_row_vertical_is_a_win
    game = TicTacToe.new(['O', 'X', ' ', ' ', 'X', ' ', 'O', 'X', 'O'])
    assert_equal "X", game.won?
  end

  def test_that_3_in_a_row_diagonal_is_a_win
    game = TicTacToe.new(['X', 'O', 'O', ' ', 'X', ' ', ' ', 'O', 'X'])
    assert_equal "X", game.won?
  end

  def test_that_full_board_and_no_win_is_a_draw
    game = TicTacToe.new(['X', 'X', 'O', 'O', 'X', 'X', 'X', 'O', 'O'])
    assert_equal true, game.draw?
  end
end
