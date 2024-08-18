class Game
  def initialize
    @new_game = TTTBoard.new()
    @char = @new_game.token
    @stop_playing = false
    play
  end

  def play
    while @stop_playing == false && @new_game.number_of_turns < 9
      puts "\nplease select square"
      selection = gets.chomp.to_i
      @new_game.mark_on_board(selection,@char)
      # @new_game.show_board
      draw_board
      @stop_playing = @new_game.winner?
      
      if @stop_playing == true
        puts "\n#{@char} is the winner"
      elsif @new_game.number_of_turns == 9
        puts "\nmax number of plays reached. Game tied"
      end
      @char = (@char == "x") ? "o" : "x"
    end
  end

  def draw_board
    array = @new_game.board
    array = array.map do |row|
      row.map {|col| col == nil ? ' ' : col}
    end

    mid_drawing = tictactoe_drawing
    mid_drawing[0][0] = array[0][0]
    mid_drawing[0][2] = array[0][1]
    mid_drawing[0][4] = array[0][2]
    
    mid_drawing[2][0] = array[1][0]
    mid_drawing[2][2] = array[1][1]
    mid_drawing[2][4] = array[1][2]

    mid_drawing[4][0] = array[2][0]
    mid_drawing[4][2] = array[2][1]
    mid_drawing[4][4] = array[2][2]

    mid_drawing.each { |row| puts row.join }
  end

  def tictactoe_drawing
    hor = '-'
    ver = '|'
    emp = ' '
    crs = '+'

    first = [emp, ver, emp, ver, emp]
    second = [hor, crs, hor, crs, hor]
    third = [emp, ver, emp, ver, emp]
    fourth = second.dup
    fifth = first.dup

    @full_board = [first, second, third, fourth, fifth]
  end
end

