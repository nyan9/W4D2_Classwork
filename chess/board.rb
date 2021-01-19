class Board

  def initialize
    @rows = Array.new(8) {Array.new(8, "_")}
    @piece = Piece.new(color, board, pos)
    @null_piece = Piece.new(color, board, pos)

    (0...@rows.length).each do |row| 
      (0...@rows.length).each do |col|
        if row <= 1 || row >= 6
          @rows[row][col] = @piece
        else 
          @rows[row][col] = @null_piece
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
    if !valid_pos?(end_pos) || @rows[start_pos] == @null_piece
      raise "Please enter a valid position for your piece!"
    else
      @rows[end_pos]= @rows[start_pos]
      @rows[start_pos]= @null_piece
    end
  end

  def valid_pos?(pos)
    if @rows[pos] == @null_piece || @row[pos] == @piece
      return true
    end

    false
  end

  private
  @null_piece = NullPiece.new
end

board1 = Board.new
