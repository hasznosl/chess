require './chess_item.rb'
require './black_pawn.rb'
require './white_pawn.rb'
require './white_rook.rb'
require './black_rook.rb'
require './white_knight.rb'
require './black_knight.rb'
require './white_bishop.rb'
require './black_bishop.rb'
require './white_queen.rb'
require './black_queen.rb'
require './white_king.rb'
require './black_king.rb'

class Board < ChessItem

  attr_accessor :board_hash
  attr_reader :whites
  attr_reader :blacks

  def initialize
    @board_hash = Hash.new(false)
    @whites = Array.new
    @blacks = Array.new
    8.times do |x|
      8.times do |y|
        if(y+1 < 5) #white side
          if(y+1 == 2)
            piece = WhitePawn.new([x+1,y+1], self)
            @whites.push piece
            @board_hash[symbolize([x+1, y+1])] = piece
          elsif(((x+1 == 8) || (x+1==1)) && (y+1 == 1))#Rook at the corner
            piece = WhiteRook.new([x+1,y+1], self)
            @board_hash[symbolize([x+1, y+1])] = piece
            @whites.push piece
          elsif((x+1 == 2) || (x+1==7)) && (y+1 == 1)#white night
            piece = WhiteKnight.new([x+1,y+1], self)
            @board_hash[symbolize([x+1,y+1])] = piece
            @whites.push piece
          elsif((x+1 == 3) || (x+1==6)) && (y+1 == 1)#white bishop
            piece = WhiteBishop.new([x+1,y+1], self)
            @board_hash[symbolize([x+1,   y+1])] = piece
            @whites.push piece
          elsif( x+1 == 4 ) && (y+1 == 1)#white Queen
            piece = WhiteQueen.new([x+1,y+1], self)
            @board_hash[symbolize([x+1, y+1])] = piece
            @whites.push piece
          elsif( x+1 == 5 ) && (y+1 == 1)#white King
            piece = WhiteKing.new([x+1,y+1], self)
            @board_hash[symbolize([x+1, y+1])] = piece
            @whites.push piece
          else
            @board_hash[symbolize([x+1, y+1])] = true
          end
        else #black side
          if(y+1 == 7)
            piece = BlackPawn.new([x+1,y+1], self)
            @board_hash[symbolize([x+1, y+1])] = piece
            @blacks.push piece
          elsif(((x+1 == 8) || (x+1==1)) && (y+1 == 8))#Rook at the corner
            piece = BlackRook.new([x+1,y+1], self)
            @board_hash[symbolize([x+1, y+1])] = piece
            @blacks.push piece
          elsif((x+1 == 2) || (x+1==7)) && (y+1 == 8)#black night
            piece = BlackKnight.new([x+1,y+1], self)
            @board_hash[symbolize([x+1, y+1])] = piece
            @blacks.push piece
          elsif((x+1 == 3) || (x+1==6)) && (y+1 == 8)#black bishop
            piece = BlackBishop.new([x+1,y+1], self)
            @board_hash[symbolize([x+1,   y+1])] = piece
            @blacks.push piece
          elsif( x+1 == 4 ) && (y+1 == 8)#black Queen
            piece = BlackQueen.new([x+1,y+1], self)
            @board_hash[symbolize([x+1, y+1])] = piece
            @blacks.push piece
          elsif( x+1 == 5 ) && (y+1 == 8)#white King
            piece = BlackKing.new([x+1,y+1], self)
            @board_hash[symbolize([x+1, y+1])] = piece
            @blacks.push piece
          else
            @board_hash[symbolize([x+1, y+1])] = true
          end
        end
      end
    end



    @whites.each do |white|
      white.refresh_checks
    end

    @blacks.each do |black|
      black.refresh_checks
    end
  end

  def run_game
    white_turn = true


    while true

      #only for debugging
      # checked_by_black = Array.new
      # @blacks.each do |black|
      #   if black.checks != nil
      #     black.checks.each do |checked|
      #       unless checked_by_black.include? checked
      #         puts "#{checked} checked by #{black}"
      #         checked_by_black.push checked
      #       end
      #     end
      #   end
      # end

      draw
      (1..8).each do |x|
        (1..8).each do |y|
          if (@board_hash[symbolize([x, y])].is_a?(Symbol))
            @board_hash[symbolize([x, y])] = true
          end
        end
      end
      coords = Array.new
      to_coords = Array.new
      puts ""
      puts "Give coords and to_coords (eg.: a2a3)"
      input = gets.chomp
      coords.push(input.split(//)[0].ord - 'a'.ord + 1)
      coords.push(input.split(//)[1].to_i)
      to_coords.push(input.split(//)[2].ord - 'a'.ord + 1)
      to_coords.push(input.split(//)[3].to_i)
      if(white_turn && @board_hash[symbolize(coords)].class.name.include?("Black"))
        puts "Buddy... it's Mr. White's turn.".colorize(:red)
        white_turn ^= true
      elsif(!white_turn && @board_hash[symbolize(coords)].class.name.include?("White"))
        puts "Buddy... it's Mr. Black's turn.".colorize(:red)
        white_turn ^= true
      else
        @board_hash[symbolize(coords)].move(to_coords)
      end
      white_turn ^= true
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
    elsif square.is_a? Symbol
          string = "*".colorize(square)
    end
    string
  end
end


Board.new.run_game
