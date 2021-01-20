require_relative "./pieces/piece"
require_relative "./pieces/null_piece"
require_relative "./pieces/pawn"
require_relative "./pieces/queen"
require_relative "./pieces/rook"
require_relative "./pieces/king"
require_relative "./pieces/knight"
require_relative "./pieces/bishop"

class Board
  attr_accessor :rows, :null_piece
  
  def initialize
    @null_piece = NullPiece.instance
    @rows = Array.new(8) {Array.new(8, null_piece)}
    populate
  end
  
  def [](pos)
    @rows[pos.first][pos.last]
  end
  
  def []=(pos, val)
    @rows[pos.first][pos.last] = val
  end

  def move_piece(start_pos, end_pos)
    if !valid_pos?(end_pos) || !valid_pos?(start_pos) || self[start_pos] == null_piece 
      raise "Please enter a valid position for your piece!"
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = null_piece
    end
  end

  def valid_pos?(pos)
    if pos.first < 0 || pos.first > 7
      return false
    elsif pos.last < 0 || pos.last > 7
      return false
    end
    true
  end

  private
  attr_reader :null_piece

  def populate
    top_backrow= [
      Rook.new(:white, self, [0,0]),
      Knight.new(:white, self, [0,1]),
      Bishop.new(:white, self, [0,2]),
      Queen.new(:white, self, [0,3]),
      Knight.new(:white, self, [0,4]),
      Bishop.new(:white, self, [0,5]),
      Knight.new(:white, self, [0,6]),
      Rook.new(:white, self, [0,7])
    ]
    
    bottom_backrow = [
      Rook.new(:black, self, [1,0]), 
      Knight.new(:black, self, [1,1]),
      Bishop.new(:black, self, [1,2]),
      Queen.new(:black, self, [1,3]),
      Knight.new(:black, self, [1,4]),
      Bishop.new(:black, self, [1,5]),
      Knight.new(:black, self, [1,6]),
      Rook.new(:black, self, [1,7])
    ]

    (0...@rows.length).each do |row|
      (0...@rows.length).each do |col|
        pos = [row,col]
        if row == 0
          self[pos] = top_backrow[col]
        elsif row == 1
          self[pos] = Pawn.new(:white, self, [row, col])
        elsif row == 6
          self[pos] = Pawn.new(:black, self, [row, col])
        elsif row == 7
          self[pos] = bottom_backrow[col]
        end
      end
    end

  end
end


#    0 1 2 3 4 5 6 7
# 0 [0,1,2,3,4,5,6,7]
# 1 [0,1,2,3,4,5,6,7]

# 2 [0,1,2,3,4,5,6,7]
# 3 [0,1,2,3,4,5,6,7]
# 4 [0,1,2,3,4,5,6,7]
# 5 [0,1,2,3,4,5,6,7]

# 6 [0,1,2,3,4,5,6,7]
# 7 [0,1,2,3,4,5,6,7]

# rows[0][i] == TOP_BACKROW
# rows[7][i] == BOTTOM_BACKROW