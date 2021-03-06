require './king.rb'

class BlackKing < King

  attr_accessor :checks

  def can_move to_coords
    if (@board.board_hash[symbolize(to_coords)] != false || @board.board_hash[symbolize(to_coords)].class.name.include?("White")) && #if target square may only be occupied by black
       (!checked to_coords)&& #target square not under check
       (to_coords[0] == @coords[0] + 1 || to_coords[0] == @coords[0] - 1 || to_coords[1] == @coords[1] + 1 || to_coords[1] == @coords[1] - 1) #max one square away
      true
    else
      false
    end
  end

  def draw
    "M".colorize(:blue)
  end

  def checked to_coords
    @board.whites.each do |piece|
      piece.checks.each do |checked|
        if to_coords == checked
          return true
        end
      end
    end
    false
  end

end
