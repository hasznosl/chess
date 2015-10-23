class Piece < ChessItem
  attr_reader :color
  attr_reader :coords

  def initialize(coords, board)
    @coords = coords
    @board = board
  end

  def can_move to_coords
    true #remember, this is just a piece
  end

  def move to_coords
    if can_move to_coords
      @board.board_hash[symbolize(@coords)] = true
      @board.board_hash[symbolize(to_coords)] = self
      @coords = to_coords
    else
      #do nothing
    end
  end


  def draw
    puts "This is just a piece.. Any special?"
  end

end
