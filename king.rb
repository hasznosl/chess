require './piece.rb'

class King < Piece

  def draw
    "M"
  end

  def checks
    @checks = Array.new
    @checks.push([@coords[0], @coords[1] + 1])
    @checks.push([@coords[0], @coords[1] - 1])
    @checks.push([@coords[0] + 1, @coords[1]])
    @checks.push([@coords[0] - 1, @coords[1]])
    @checks.push([@coords[0] + 1, @coords[1] + 1])
    @checks.push([@coords[0] + 1, @coords[1] - 1])
    @checks.push([@coords[0] - 1, @coords[1] + 1])
    @checks.push([@coords[0] - 1, @coords[1] - 1])
    @checks
  end

end
