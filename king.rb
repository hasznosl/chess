require './piece.rb'

class King < Piece

  def draw
    "M"
  end

  def refresh_checks
    @checks = Array.new
    @checks.push([@coords[0], @coords[1] + 1]) if @board.board_hash[symbolize([@coords[0], @coords[1] + 1])]
    @checks.push([@coords[0], @coords[1] - 1]) if @board.board_hash[symbolize([@coords[0], @coords[1] - 1])]
    @checks.push([@coords[0] + 1, @coords[1]]) if @board.board_hash[symbolize([@coords[0] + 1, @coords[1]])]
    @checks.push([@coords[0] - 1, @coords[1]]) if @board.board_hash[symbolize([@coords[0] - 1, @coords[1]])]
    @checks.push([@coords[0] + 1, @coords[1] + 1]) if @board.board_hash[symbolize([@coords[0] + 1, @coords[1] + 1])]
    @checks.push([@coords[0] + 1, @coords[1] - 1]) if @board.board_hash[symbolize([@coords[0] + 1, @coords[1] - 1])]
    @checks.push([@coords[0] - 1, @coords[1] + 1]) if @board.board_hash[symbolize([@coords[0] - 1, @coords[1] + 1])]
    @checks.push([@coords[0] - 1, @coords[1] - 1]) if @board.board_hash[symbolize([@coords[0] - 1, @coords[1] - 1])]
    colorize_checked
    @checks
  end

end
