class Piece < ChessItem
  attr_reader :color
  attr_reader :coords

  def initialize(coords, board, color)
    @coords = coords
    @board = board
    @color = color
  end

  def sees to_coords
  end

  def move to_coords
    @board.board_hash[symbolize(@coords)] = true
    @board.board_hash[symbolize(to_coords)] = self
    @coords = to_coords
  end

  def hit_n_move
  end

  def draw
    puts "This is just a piece.. Any special?"
  end


end
