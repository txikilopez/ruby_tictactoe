require_relative './lib/board'
require_relative './lib/turn'
require 'pry-byebug'

new_game = TTTBoard.new()
char = "x"

7.times do
  puts "please select square"
  selection = gets.chomp.to_i
  new_game.mark_on_board(selection,char)
  new_game.show_board

  p new_game.game_score

  char = (char == "x") ? "o" : "x"
end