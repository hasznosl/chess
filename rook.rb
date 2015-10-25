require './piece.rb'

class Rook < Piece
  def draw
    "R"
  end


  def refresh_checks
    @checks = Array.new
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
    @checks.uniq!
    colorize_checked
    @checks
  end

  private

  def road_blocked? to_coords
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
end
