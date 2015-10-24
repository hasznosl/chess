require "./piece.rb"

class Pawn < Piece

  def draw
    "P"
  end

  def checks
    @checks = Array.new
    @checks.push([@coords[0] + 1, @coords[1] + 1])
    @checks.push([@coords[0] - 1, @coords[1] + 1])
    @checks
  end

end
