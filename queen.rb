  require './piece.rb'

class Queen < Piece
  def draw
    "Q"
  end

  def checks
    @checks = Array.new
    9.times do |i|
      to_coords = [@coords[0] + i, @coords[1] + i]
      if road_blocked? to_coords
        break
      end
      @checks.push(to_coords)
    end

    9.times do |i|
      to_coords = [@coords[0] - i, @coords[1] - i]
      if road_blocked? to_coords
        break
      end
      @checks.push(to_coords)
    end

    9.times do |i|
      to_coords = [@coords[0] + i, @coords[1] - i]
      if road_blocked? to_coords
        break
      end
      @checks.push(to_coords)
    end

    9.times do |i|
      to_coords = [@coords[0] - i, @coords[1] + i]
      if road_blocked? to_coords
        break
      end
      @checks.push(to_coords)
    end

    9.times do |i|
      to_coords = [@coords[0], @coords[1] + i]
      if road_blocked? to_coords
        break
      end
      @checks.push(to_coords)
    end

    9.times do |i|
      to_coords = [@coords[0], @coords[1] - i]
      if road_blocked? to_coords
        break
      end
      @checks.push(to_coords)
    end

    9.times do |i|
      to_coords = [@coords[0] + i, @coords[1] ]
      if road_blocked? to_coords
        break
      end
      @checks.push(to_coords)
    end

    9.times do |i|
      to_coords = [@coords[0] - i, @coords[1] ]
      if road_blocked? to_coords
        break
      end
      @checks.push(to_coords)
    end
    @checks
  end

  private

  def road_blocked_rookishly? to_coords
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



  def road_blocked_bishopishly? to_coords
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

  def road_blocked? to_coords
    if(to_coords[0] == @coords[0] || to_coords[0] == @coords[0])
      road_blocked_rookishly? to_coords
    else
      road_blocked_bishopishly? to_coords
    end
  end

end
