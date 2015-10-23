class Piece < ChessItem
  attr_reader :color
  attr_reader :coords

  def initialize(coords, board, color)
    @coords = coords
    @board = board
    @color = color
  end

  def sees
  end

  def move
  end

  def hit_n_move
  end

  def draw
    puts "This is just a piece.. Any special?"
  end


end
