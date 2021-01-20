# require_relative "../board"

class Piece
  attr_reader :pos, :board, :color
  def initialize(color = nil, board = nil , pos = nil)
    @color = color
    @board = board
    @pos = pos
  end

  def move_dir
    avaiable_moves = []
  end

end
