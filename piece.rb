require 'colorize'

class Piece < ChessItem
  attr_reader :color
  attr_reader :coords
  attr_reader :checks

  def initialize(coords, board)
    @coords = coords
    @board = board
  end

  def refresh_checks
    puts "wrong checks called"# override in specific classes
  end

  def colorize_checked
    #should be nil eventually, this is only for debugging
    @checks.each do |coord|
      if (@board.board_hash[symbolize(coord)] == true )
        @board.board_hash[symbolize(coord)] = :yellow
      end
    end
  end

  def move to_coords
    if can_move to_coords
      @board.board_hash[symbolize(@coords)] = true
      @board.board_hash[symbolize(to_coords)] = self
      @coords = to_coords
      refresh_checks
    else
      #do nothing
    end
  end


  def draw
    puts "This is just a piece.. Any special?"
  end

  private



  def can_move to_coords
    false
  end


end
