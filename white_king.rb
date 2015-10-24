require './king.rb'

class WhiteKing < King


  def can_move to_coords
    if (@board.board_hash[symbolize(to_coords)] != false || @board.board_hash[symbolize(to_coords)].class.name.include?("Black")) && #if target square may only be occupied by black
       (!checked to_coords)&& #target square not under check
       (to_coords[0] == @coords[0] + 1 || to_coords[0] == @coords[0] - 1 || to_coords[1] == @coords[1] + 1 || to_coords[1] == @coords[1] - 1) #max one square away
      true
    else
      false
    end
  end


  def checked to_coords
    @board.blacks.each do |piece|
      piece.checks.each do |checked|
        if to_coords == checked
          return true
        end
      end
    end
    false
  end

  def draw
    "M".colorize(:cyan)
  end
end
