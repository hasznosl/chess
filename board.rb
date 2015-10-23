require './chess_item.rb'
require './black_pawn.rb'
require './white_pawn.rb'
require './white_rook.rb'
require './black_rook.rb'

class Board < ChessItem

  attr_accessor :board_hash
  def initialize
    @board_hash = Hash.new(false)
    8.times do |x|
      8.times do |y|
        if(y+1 < 5) #white side
          if(y+1 == 2)
            @board_hash[symbolize([x+1, y+1])] = WhitePawn.new([x+1,y+1], self)
          elsif(((x+1 == 8) || (x+1==1)) && (y+1 == 1))#Rook at the corner
            @board_hash[symbolize([x+1, y+1])] = WhiteRook.new([x+1,y+1], self)
          else
            @board_hash[symbolize([x+1, y+1])] = true
          end
        else #black side
          if(y+1 == 7)
            @board_hash[symbolize([x+1, y+1])] = BlackPawn.new([x+1,y+1], self)
          elsif(((x+1 == 8) || (x+1==1)) && (y+1 == 8))#Rook at the corner
            @board_hash[symbolize([x+1, y+1])] = BlackRook.new([x+1,y+1], self)
          else
            @board_hash[symbolize([x+1, y+1])] = true
          end
        end
      end
    end
  end

  def run_game
    while true
      draw
      coords = Array.new
      to_coords = Array.new
      puts ""
      puts "Give coords and to_coords (eg.: a2a3)"
      input = gets.chomp
      coords.push(input.split(//)[0].ord - 'a'.ord + 1)
      coords.push(input.split(//)[1].to_i)
      to_coords.push(input.split(//)[2].ord - 'a'.ord + 1)
      to_coords.push(input.split(//)[3].to_i)
      @board_hash[symbolize(coords)].move(to_coords)
    end
  end

  def draw

    puts "  ------------------------------- "
    puts "8| #{dp [1, 8]} | #{dp [2, 8]} | #{dp [3, 8]} | #{dp [4, 8]} | #{dp [5, 8]} | #{dp [6, 8]} | #{dp [7, 8]} | #{dp [8, 8]} |"
    puts "  ------------------------------- "
    puts "7| #{dp [1, 7]} | #{dp [2, 7]} | #{dp [3, 7]} | #{dp [4, 7]} | #{dp [5, 7]} | #{dp [6, 7]} | #{dp [7, 7]} | #{dp [8, 7]} |"
    puts "  ------------------------------- "
    puts "6| #{dp [1, 6]} | #{dp [2, 6]} | #{dp [3, 6]} | #{dp [4, 6]} | #{dp [5, 6]} | #{dp [6, 6]} | #{dp [7, 6]} | #{dp [8, 6]} |"
    puts "  ------------------------------- "
    puts "5| #{dp [1, 5]} | #{dp [2, 5]} | #{dp [3, 5]} | #{dp [4, 5]} | #{dp [5, 5]} | #{dp [6, 5]} | #{dp [7, 5]} | #{dp [8, 5]} |"
    puts "  ------------------------------- "
    puts "4| #{dp [1, 4]} | #{dp [2, 4]} | #{dp [3, 4]} | #{dp [4, 4]} | #{dp [5, 4]} | #{dp [6, 4]} | #{dp [7, 4]} | #{dp [8, 4]} |"
    puts "  ------------------------------- "
    puts "3| #{dp [1, 3]} | #{dp [2, 3]} | #{dp [3, 3]} | #{dp [4, 3]} | #{dp [5, 3]} | #{dp [6, 3]} | #{dp [7, 3]} | #{dp [8, 3]} |"
    puts "  ------------------------------- "
    puts "2| #{dp [1, 2]} | #{dp [2, 2]} | #{dp [3, 2]} | #{dp [4, 2]} | #{dp [5, 2]} | #{dp [6, 2]} | #{dp [7, 2]} | #{dp [8, 2]} |"
    puts "  ------------------------------- "
    puts "1| #{dp [1, 1]} | #{dp [2, 1]} | #{dp [3, 1]} | #{dp [4, 1]} | #{dp [5, 1]} | #{dp [6, 1]} | #{dp [7, 1]} | #{dp [8, 1]} |"
    puts "  ------------------------------- "
    puts "   a   b   c   d   e   f   g   h  "

  end

  def dp coords #stands for draw piece
    string = " "
    square = @board_hash[(symbolize(coords))]
    if square.is_a? Piece
      string = square.draw
    end
    string
  end
end


Board.new.run_game
