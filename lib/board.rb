class TTTBoard
  attr_accessor :board
  
  def initialize
    @board = Array.new(3) {Array.new(3)}
  end
  
  def mark_on_board(num, char)
    a = (num.to_i - 1)/3
    b = (num.to_i-1) % 3
    self.board[a][b] = char
  end

  def show_board
    board.each do |row|
      p row
    end
  end

  def game_score
    calculate_board_score
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

  end


end