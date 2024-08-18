require_relative './lib/turn'
require_relative './lib/board'
require 'pry-byebug'

new_game = TTTBoard.new()
char = new_game.token
stop_playing = false

while stop_playing == false && new_game.number_of_turns < 9
  puts "\nplease select square"
  selection = gets.chomp.to_i
  new_game.mark_on_board(selection,char)
  new_game.show_board
  stop_playing = new_game.winner?
  # turns_played = new_game.number_of_turns
  
  if stop_playing == true
    puts "\n#{char} is the winner"
  elsif new_game.number_of_turns == 9
    puts "\nmax number of plays reached. Game tied"
  end

  char = (char == "x") ? "o" : "x"
end
