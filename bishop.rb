require './piece.rb'

class Bishop < Piece

  def draw
    "B"
  end

  def refresh_checks
    @checks = Array.new
    9.times do |i|
      to_coords = [@coords[0] + i, @coords[1] + i]
      if road_blocked to_coords
        if @board.board_hash[symbolize(to_coords)].is_a? Piece
          @checks.push(to_coords)
        end
        break
      end
      @checks.push(to_coords)
    end

    9.times do |i|
      to_coords = [@coords[0] - i, @coords[1] - i]
      if road_blocked to_coords
        if @board.board_hash[symbolize(to_coords)].is_a? Piece
          @checks.push(to_coords)
        end
        break
      end
      @checks.push(to_coords)
    end

    9.times do |i|
      to_coords = [@coords[0] + i, @coords[1] - i]
      if road_blocked to_coords
        if @board.board_hash[symbolize(to_coords)].is_a? Piece
          @checks.push(to_coords)
        end
        break
      end
      @checks.push(to_coords)
    end

    9.times do |i|
      to_coords = [@coords[0] - i, @coords[1] + i]
      if road_blocked to_coords
        if @board.board_hash[symbolize(to_coords)].is_a? Piece
          @checks.push(to_coords)
        end
        break
      end
      @checks.push(to_coords)
    end
    colorize_checked
    @checks
  end

  private

  def road_blocked to_coords
    y_diff = to_coords[1] - @coords[1]
    x_diff = to_coords[0] - @coords[0]
    unless(x_diff == y_diff || x_diff == y_diff*(-1))
      raise
    end
    y_range = nil
    x_range = nil
    if (y_diff < 0)
      y_range = ((@coords[1]-1).downto(to_coords[1]+1))
    else
      y_range = (@coords[1]+1)..(to_coords[1]-1)
    end

    if (x_diff < 0)
      x_range = ((@coords[0]-1).downto(to_coords[0]+1))
    else
      x_range = (@coords[0]+1)..(to_coords[0]-1)
    end

    x_range.size.times do |i|
      x = x_range.to_a[i]
      y = y_range.to_a[i]
      target_object = @board.board_hash[symbolize([x, y])]
      if((target_object.is_a?(Piece) || target_object == false) && (target_object != self))
        return true
      end
    end
    return false
  end

end
