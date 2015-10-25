require './piece.rb'


class Queen < Piece
  def draw
    "Q"
  end

  def refresh_checks
    @checks = Array.new
    10.times do |i|
      to_coords = [@coords[0] + i, @coords[1] + i]
      if road_blocked? to_coords
        if @board.board_hash[symbolize(to_coords)].is_a? Piece
          @checks.push(to_coords)
        end
        break
      end
      @checks.push(to_coords)
    end

    10.times do |i|
      to_coords = [@coords[0] - i, @coords[1] - i]
      if road_blocked? to_coords
        if @board.board_hash[symbolize(to_coords)].is_a? Piece
          @checks.push(to_coords)
        end
        break
      end
      @checks.push(to_coords)
    end

    10.times do |i|
      to_coords = [@coords[0] + i, @coords[1] - i]
      if road_blocked? to_coords
        if @board.board_hash[symbolize(to_coords)].is_a? Piece
          @checks.push(to_coords)
        end
        break
      end
      @checks.push(to_coords)
    end

    10.times do |i|
      to_coords = [@coords[0] - i, @coords[1] + i]
      if road_blocked? to_coords
        if @board.board_hash[symbolize(to_coords)].is_a? Piece
          @checks.push(to_coords)
        end
        break
      end
      @checks.push(to_coords)
    end

    10.times do |i|
      to_coords = [@coords[0], @coords[1] + i]
      if road_blocked? to_coords
        if @board.board_hash[symbolize(to_coords)].is_a? Piece
          @checks.push(to_coords)
        end
        break
      end
      @checks.push(to_coords)
    end

    10.times do |i|
      to_coords = [@coords[0], @coords[1] - i]
      if road_blocked? to_coords
        if @board.board_hash[symbolize(to_coords)].is_a? Piece
          @checks.push(to_coords)
        end
        break
      end
      @checks.push(to_coords)
    end

    10.times do |i|
      to_coords = [@coords[0] + i, @coords[1] ]
      if road_blocked? to_coords
        if @board.board_hash[symbolize(to_coords)].is_a? Piece
          @checks.push(to_coords)
        end
        break
      end
      @checks.push(to_coords)
    end

    10.times do |i|
      to_coords = [@coords[0] - i, @coords[1] ]
      if road_blocked? to_coords
        if @board.board_hash[symbolize(to_coords)].is_a? Piece
          @checks.push(to_coords)
        end
        break
      end
      @checks.push(to_coords)
    end
    @checks.uniq!
    colorize_checked
    @checks
  end

  private

  def road_blocked_rookishly? to_coords
    if to_coords[0] == @coords[0]#moving in column
      if to_coords[1] > @coords[1]# moving up
        (@coords[1]..to_coords[1]).each do |y|
          object = @board.board_hash[symbolize([@coords[0],y])]
          if ((object.is_a? Piece) && (object != self) ) || (object == false)#road blocked
            return true
          end
        end
        return false
      else#moving down
        (@coords[1].downto(to_coords[1])).each do |y|
          object = @board.board_hash[symbolize([@coords[0],y])]
          if ((object.is_a? Piece) && (object != self)) || (object== false)#road blocked
            return true
          end
        end
        return false
      end
    else#moving in row
      if to_coords[0] > @coords[0]# moving right
        (@coords[0]..to_coords[0]).each do |x|
          object = @board.board_hash[symbolize([x,@coords[1]])]
          if ((object.is_a? Piece) && (object != self)) || (object== false)#road blocked
            return true
          end
        end
        return false
      else#moving left
        (@coords[0].downto(to_coords[0])).each do |x|
          object = @board.board_hash[symbolize([x,@coords[1]])]
          if ((object.is_a? Piece) && (object != self)) || (object== false)#road blocked
            return true
          end
        end
        return false
      end
    end
  end



  def road_blocked_bishopishly? to_coords
    y_diff = to_coords[1] - @coords[1]
    x_diff = to_coords[0] - @coords[0]
    unless(x_diff == y_diff || x_diff == y_diff*(-1))
      raise "illegal bishopis check call"
    end
    y_range = nil
    x_range = nil
    if (y_diff < 0)
      y_range = ((@coords[1]).downto(to_coords[1])).to_a
    else
      y_range = ((@coords[1])..(to_coords[1])).to_a
    end

    if (x_diff < 0)
      x_range = ((@coords[0]).downto(to_coords[0])).to_a
    else
      x_range = ((@coords[0])..(to_coords[0])).to_a
    end


    raise "x != y" if x_range.size != y_range.size

    x_range.size.times do |i|
      x = x_range[i]
      y = y_range[i]
      target_object = @board.board_hash[symbolize([x, y])]
      if((target_object.is_a?(Piece) || target_object == false) && (target_object != self))
        return true
      end
    end
    return false
  end

  def road_blocked? to_coords
    y_diff = @coords[1] - to_coords[1]
    x_diff = @coords[0] - to_coords[0]
    if(to_coords[0] == @coords[0] || to_coords[1] == @coords[1])
      return road_blocked_rookishly? to_coords
    elsif(x_diff == y_diff || x_diff == y_diff *(-1))
      return road_blocked_bishopishly? to_coords
    else
      raise "road_blocked? called improperly, y_diff = #{y_diff}, x_diff = #{x_diff}, to_coords = #{to_coords}, self = #{self}"
    end
  end

end
