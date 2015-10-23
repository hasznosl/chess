class Board < ChessItem


  def initialize
    @board_hash = Hash.new(false)
    8.times do |x|
      8.each do |y|
        if(y < 5) #white side
          color = "white"
          if(y == 2)
            @board_hash[symbolize([x, y])] = Pawn.new(color)
          else
            @board_hash[symbolize([x, y])] = true
          end
        else #black side
          color = "black"
          if(y == 7)
            @board_hash[symbolize([x, y])] = Pawn.new(color)
          else
            @board_hash[symbolize([x, y])] = true
          end
        end
      end
    end
  end


  def draw

    puts "  ------------------------------- "
    puts "8|   |   |   |   |   |   |   |   |"
    puts "  ------------------------------- "
    puts "7|   |   |   |   |   |   |   |   |"
    puts "  ------------------------------- "
    puts "6|   |   |   |   |   |   |   |   |"
    puts "  ------------------------------- "
    puts "5|   |   |   |   |   |   |   |   |"
    puts "  ------------------------------- "
    puts "4|   |   |   |   |   |   |   |   |"
    puts "  ------------------------------- "
    puts "3|   |   |   |   |   |   |   |   |"
    puts "  ------------------------------- "
    puts "2|   |   |   |   |   |   |   |   |"
    puts "  ------------------------------- "
    puts "1|   |   |   |   |   |   |   |   |"
    puts "  ------------------------------- "
    puts "   a   b   c   d   e   f   g   h  "

  end

  def dp coords #stands for draw piece
    ret = "*"
    @board_hash(symbolize(coords))
  end
end
