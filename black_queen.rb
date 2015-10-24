require './queen'

class BlackQueen < Queen

  def can_move to_coords
    diff = to_coords[1] - @coords[1]
    if (
      (to_coords[0] == @coords[0] || to_coords[1] == @coords[1]) ||#wants to move rookish
      (( (to_coords[0] - @coords[0]) == diff) || (to_coords[0] - @coords[0]) == diff*(-1)) # or bishopish movement
      ) &&
      (!road_blocked? to_coords) && #road not blocked to the given coords
      (@board.board_hash[symbolize(to_coords)] == true || @board.board_hash[symbolize(to_coords)].class.name.include?("White")) #target coords either enemy or true
      true
    else
      false
    end
  end

  def draw
    "Q".colorize(:blue)
  end
end
