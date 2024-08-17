require_relative './lib/board'
require_relative './lib/turn'
require 'pry-byebug'

new_game = TTTBoard.new()
char = "x"
stop_playing = false
turns_played = 0

while stop_playing == false && turns_played < 9
  puts "\nplease select square"
  selection = gets.chomp.to_i
  new_game.mark_on_board(selection,char)
  new_game.show_board
  stop_playing = new_game.winner?
  turns_played = new_game.number_of_turns
  
  if stop_playing == true
    puts "\n#{char} is the winner"
  elsif turns_played == 9
    puts "\nmax number of plays reached. Game tied"
  end

  char = (char == "x") ? "o" : "x"
end
