class TTTBoard
  attr_accessor :board
  @@chosen_num = []
  
  def initialize
    @board = Array.new(3) {Array.new(3)}
    initial_text
  end

  def initial_text
    puts "Welcome to Tic Tac Toe."
    puts "board will be as follows:"
    p [1,2,3]
    p [4,5,6]
    p [7,8,9]
    puts "Pick a number that represents a square. First player will be x"
  end
  
  def mark_on_board(num, char)
    if check_num(num.to_i)
      puts "invalid number, please choose another"
      num2 = gets.chomp.to_i
      mark_on_board(num2,char)
    else
      a = (num.to_i - 1)/3
      b = (num.to_i-1) % 3
      self.board[a][b] = char
      @@chosen_num << num.to_i
    end
  end

  def number_of_turns
    @@chosen_num.length
  end

  def show_board
    puts "\n"
    board.each do |row|
      p row.map {|col| col == nil ? "" : col}
    end
  end

  def game_score
    calculate_board_score
  end

  def winner?
     calculate_board_score.max == 3 || calculate_board_score.min == -3
  end

  private

  def convert_board_score
    @score = board.map do |row|
              row.map do |col|
                if col == "x"
                  1
                elsif col == "o"
                  -1
                else
                  0
                end
              end
            end
  end

  def calculate_board_score
    arr = convert_board_score
    diag = []
    rows = arr.map do |row|
              row.sum
    end.minmax

    cols = arr.transpose.map do |colmn|
              colmn.sum
    end.minmax

    diag = [arr[0][0] + arr[1][1] + arr[2][2],
            arr[1][1] + arr[0][2] + arr[2][0]].minmax
  
    @score = [rows,cols,diag].flatten.minmax
  end 

  def check_num(num)
    @@chosen_num.include?(num) || num < 1 || num > 9
  end
end