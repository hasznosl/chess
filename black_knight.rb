require './knight.rb'

class BlackKnight < Knight

  def can_move to_coords
    if (!@board.board_hash[symbolize(to_coords)].class.name.include? "Black") && #to_coords is not occupied by own piece
       (@board.board_hash[symbolize(to_coords)] != false) #inside the board
       if((@coords[1] == to_coords[1] + 1 || @coords[1] == to_coords[1] - 1) && (@coords[0] == to_coords[0] + 2 || @coords[0] == to_coords[0] - 2)) ||
         ((@coords[0] == to_coords[0] + 1 || @coords[0] == to_coords[0] - 1) && (@coords[1] == to_coords[1] + 2 || @coords[1] == to_coords[1] - 2))
        return true
      end
      false
    else
      false
    end
  end

end
