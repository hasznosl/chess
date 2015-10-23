require './bishop.rb'

class BlackBishop < Bishop

  def can_move to_coords
    diff = to_coords[1] - @coords[1]
    if (((to_coords[0] - @coords[0]) == diff) || (to_coords[0] - @coords[0]) == diff*(-1)) && #wants to move in diagonal
       (!road_blocked to_coords) && #road not blocked
       (( @board.board_hash[symbolize(to_coords)] == true) || @board.board_hash[symbolize(to_coords)].class.name.include?("White")) #target square is either unoccupied or enemy
      true
    else
      false
    end
  end

end
