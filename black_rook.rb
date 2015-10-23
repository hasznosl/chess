require './rook.rb'

class BlackRook < Rook

  def can_move to_coords
    if ((to_coords[0] == @coords[0]) || (to_coords[1] == @coords[1])) && #in same row or column
       (!@board.board_hash[symbolize(to_coords)].class.name.include? "Black") &&
       (!road_blocked? to_coords) &&# road not blocked
       (@board.board_hash[symbolize(to_coords)] != false) #inside the board
      true
    elsif ((to_coords[0] == @coords[0]) || (to_coords[1] == @coords[1])) && #same row or column
          (@board.board_hash[symbolize(to_coords)].class.name.include? "White") && #enemy piece
          (!road_blocked? to_coords)#road not blocked
      true
    else
      false
    end
  end




end
