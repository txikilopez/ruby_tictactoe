require_relative './lib/board'
require_relative './lib/turn'
require 'pry-byebug'

puts "Welcome to Tic Tac Toe please first player be x, second player will be o"

new_game = TTTBoard.new()
# puts new_game.board
char = "x"

7.times do
  puts "please select square"
  selection = gets.chomp
  new_game.mark_on_board(selection,char)
  new_game.show_board

  p new_game.game_score

  char = (char == "x") ? "o" : "x"
end