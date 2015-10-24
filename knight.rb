require './piece.rb'

class Knight < Piece

  def draw
    "K"
  end

  def checks
    @checks = Array.new
    @checks.push([@coords[0]+1, @coords[1]+2])
    @checks.push([@coords[0]+1, @coords[1]-2])
    @checks.push([@coords[0]-1, @coords[1]+2])
    @checks.push([@coords[0]-1, @coords[1]-2])
    @checks.push([@coords[0]+2, @coords[1]+1])
    @checks.push([@coords[0]-2, @coords[1]-1])
    @checks.push([@coords[0]+2, @coords[1]+1])
    @checks.push([@coords[0]-2, @coords[1]-1])
    @checks
  end

end
