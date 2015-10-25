require './piece.rb'

class Knight < Piece

  def draw
    "K"
  end

  def refresh_checks
    @checks = Array.new
    @checks.push([@coords[0]+1, @coords[1]+2]) if @board.board_hash[symbolize([@coords[0]+1, @coords[1]+2])]
    @checks.push([@coords[0]+1, @coords[1]-2]) if @board.board_hash[symbolize([@coords[0]+1, @coords[1]-2])]
    @checks.push([@coords[0]-1, @coords[1]+2]) if @board.board_hash[symbolize([@coords[0]-1, @coords[1]+2])]
    @checks.push([@coords[0]-1, @coords[1]-2]) if @board.board_hash[symbolize([@coords[0]-1, @coords[1]-2])]
    @checks.push([@coords[0]+2, @coords[1]+1]) if @board.board_hash[symbolize([@coords[0]+2, @coords[1]+1])]
    @checks.push([@coords[0]+2, @coords[1]-1]) if @board.board_hash[symbolize([@coords[0]+2, @coords[1]-1])]
    @checks.push([@coords[0]-2, @coords[1]+1]) if @board.board_hash[symbolize([@coords[0]-2, @coords[1]+1])]
    @checks.push([@coords[0]-2, @coords[1]-1]) if @board.board_hash[symbolize([@coords[0]-2, @coords[1]-1])]
    @checks.uniq!
    colorize_checked
    @checks
  end

end
