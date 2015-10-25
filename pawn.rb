require "./piece.rb"

class Pawn < Piece

  def draw
    "P"
  end

  def occupied? arr_of_coords
    arr_of_coords.each do |coord|
      if(@board.board_hash[symbolize(coord)].is_a? Piece)
        return true
      end
    end
    return false
  end

end
