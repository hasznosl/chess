require './piece.rb'

class Bishop < Piece

  def draw
    "B"
  end

  private

  def road_blocked to_coords
    y_diff = to_coords[1] - @coords[1]
    x_diff = to_coords[0] - @coords[0]
    y_range = nil
    x_range = nil
    if (y_diff < 0)
      y_range = (to_coords[1]+1)..(@coords[1]-1)
    else
      y_range = (@coords[1]+1)..(to_coords[1]-1)
    end

    if (x_diff < 0)
      x_range = (to_coords[0]+1)..(@coords[0]-1)
    else
      x_range = (@coords[0]+1)..(to_coords[0]-1)
    end


    (x_range.last - x_range.first + 1).times do |i|
      x = x_range.first + i
      y = y_range.first + i
      target_object = @board.board_hash[symbolize([x, y])]
      if(target_object.is_a? Piece || target_object == false)
        return true
      end
    end


    return false
  end

end
