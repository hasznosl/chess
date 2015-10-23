class Piece < ChessItem
  attr_reader :color
  attr_reader :coords

  def initialize(coords, board)
    @coords = coords
    @board = board
  end

  def occupied? arr_of_coords
    arr_of_coords.each do |coord|
      if(@board.board_hash[symbolize(coord)].is_a? Piece)
        raise "#{coord} is occupied"
        return true
      end
    end
    return false
  end

  def can_move to_coords
    false
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
