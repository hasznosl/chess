require "./piece.rb"

class WhitePawn < Pawn
  def can_move to_coords
    if(@coords[1] == 2)
      if (to_coords[0] == @coords[0]) && (to_coords[1] == 4 || to_coords[1] == 3) && !occupied?([[@coords[0], 3], to_coords])
        true
      else#hitting with pawn not handled yet
        raise "cant move to #{to_coords}"
        false
      end
    elsif (to_coords[0] == @coords[0]) && (@coords[1] + 1 == to_coords[1]) && !occupied?([to_coords])
      true
    else
      false
    end
  end

end
