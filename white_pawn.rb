require "./piece.rb"

class WhitePawn < Pawn
  def can_move to_coords
    if(@coords[1] == 2) #pawn at starting position?
      if (to_coords[0] == @coords[0]) && #wants to move in same column
         (to_coords[1] == 4 || to_coords[1] == 3) && #want to step one or two?
         !occupied?([[@coords[0], 3], to_coords])# way not blocked?
        true
      elsif ((to_coords[0] + 1 == @coords[0]) || (to_coords[0] - 1 == @coords[0])) &&  #wants to step one col left or right?
            (@coords[1] + 1 == to_coords[1]) && #wants to step exactly one step forward?
            (@board.board_hash[symbolize(to_coords)].class.name.include?("Black")) #black piece at the target coords?
        true
      else
        raise "cant move to #{to_coords}"
        false
      end
    elsif (to_coords[0] == @coords[0]) &&  # wants to stay in same column
          (@coords[1] + 1 == to_coords[1]) &&  #wants to step one forward?
          !occupied?([to_coords]) && # way not blocked?
          (@board.board_hash[symbolize(to_coords)] != false) #inside the board
      true
    elsif ((to_coords[0] + 1 == @coords[0]) || (to_coords[0] - 1 == @coords[0])) &&  #wants to step one col left or right?
          (@coords[1] + 1 == to_coords[1]) && #wants to step exactly one step forward?
          (@board.board_hash[symbolize(to_coords)].class.name.include?("Black")) #black piece at the target coords?
      true
    else
      false
    end
  end

  def refresh_checks
    @checks = Array.new
    @checks.push([@coords[0] + 1, @coords[1] + 1]) if @board.board_hash[symbolize([@coords[0] + 1, @coords[1] + 1])]
    @checks.push([@coords[0] - 1, @coords[1] + 1]) if @board.board_hash[symbolize([@coords[0] - 1, @coords[1] + 1])]
    colorize_checked
    @checks
  end

  def draw
    "P".colorize(:cyan)
  end

end
