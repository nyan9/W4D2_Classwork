class Board
  def initialize
    @rows = Array.new(8) {Array.new(8)}
    @piece = Piece.new(color, board, pos)
    @null_piece = Piece.new(color, board, pos)
  end
  
  def [](pos)
    @rows[pos.first][pos.last]
  end
  
  def []=(pos, val)
    @rows[pos.first][pos.last] = val
  end

  def move_piece(start_pos, end_pos)
    unless valid_pos?(end_pos) || @rows[start_pos] == @null_piece
      raise "Please enter a valid position for your piece!"
    end
  end

  private
  @null_piece = NullPiece.new()
end

board1 = Board.new
