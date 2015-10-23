require './rook.rb'

class WhiteRook < Rook

  def can_move to_coords
    if ((to_coords[0] == @coords[0]) || (to_coords[1] == @coords[1])) && #in same row or column
       (!road_blocked? to_coords)# road not blocked
      true
    elsif ((to_coords[0] == @coords[0]) || (to_coords[1] == @coords[1])) && #same row or column
          (@board.board_hash[symbolize(to_coords)].class.name.include? "Black") && #enemy piece
          (!road_blocked? to_coords)#road not blocked
      true
    else
      false
    end
  end

  private

  def road_blocked? to_coords
    if to_coords[0] == @coords[0]#moving in column
      if to_coords[1] > @coords[1]# moving up
        (@coords[1]...to_coords[1]).each do |y|
          if (@board.board_hash[symbolize([coords[0],y])].is_a? Piece) && (@board.board_hash[symbolize([coords[0],y])] != self) #road blocked
            return true
          end
        end
        return false
      else#moving down
        (@coords[1].downto(to_coords[1]+1)).each do |y|
          if (@board.board_hash[symbolize([coords[0],y])].is_a? Piece) && (@board.board_hash[symbolize([coords[0],y])] != self)#road blocked
            return true
          end
        end
        return false
      end
    else#moving in row
      if to_coords[0] > @coords[0]# moving right
        (@coords[0]...to_coords[0]).each do |x|
          if (@board.board_hash[symbolize([x,coords[1]])].is_a? Piece) && (@board.board_hash[symbolize([x,coords[1]])] != self)#road blocked
            return true
          end
        end
        return false
      else#moving left
        (@coords[0].downto(to_coords[0]+1)).each do |x|
          if (@board.board_hash[symbolize([x,coords[1]])].is_a? Piece) && (@board.board_hash[symbolize([x,coords[1]])] != self)#road blocked
            return true
          end
        end
        return false
      end
    end
  end

end