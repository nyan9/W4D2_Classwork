require_relative "./pieces/piece"
require_relative "./pieces/null_piece"

class Board
  # attr_accessor :rows, :piece, :null_piece
  
  def initialize
    @piece = Piece.new
    @null_piece = NullPiece.instance
    @rows = Array.new(8) {Array.new(8, null_piece)}

    (0...@rows.length).each do |row| 
      (0...@rows.length).each do |col|
        if row <= 1 || row >= 6
          @rows[row][col] = Piece.new
        end
      end
    end
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
      self[end_pos]= self[start_pos]
      self[start_pos]= null_piece
    end
  end

  def valid_pos?(pos)
    if pos.first < 0 || pos.first > 7
      return false
    elsif pos.last < 0 || pos.last > 7
      return false
    end 

    unless self[pos] == @null_piece || self[pos].class == @piece.class
      return false
    end

    true
  end

   private
  attr_reader :null_piece
end

# board1 = Board.new
