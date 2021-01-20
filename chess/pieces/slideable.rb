module Slideable
  HORIZONTAL_DIR = [
    [0, -1], # left
    [0, 1],  # right
    [-1, 0], # up
    [1, 0]  # down
  ].freeze

  DIAGONAL_DIR = [
    [-1, -1], # up left
    [-1, 1],  # up right
    [1, -1],  # down left
    [1, 1]   # down right
  ].freeze

  def horizontal_dir
    HORIZONTAL_DIR
  end

  def diagnoal_dir
    DIAGONAL_DIR
  end

  def moves
    # create empty for all possible moves
    # iterate over move_dirs from subclass to find valid direction
    # check the board to see if possible/or out of bounds
    # possible moves << add all valid pos from current pos

    # 16 pos positions only up down left right
    all_moves= []
    self.moves_dirs.each do |dir|
      current_pos = self.pos
      until valid_pos?(current_pos) == false #filtering out pieces out of bounds of board
        current_pos = [current_pos[0] + dir[0], current_pos[1] + dir[1]]   #=> [0+1,0+1] => [1,1]
        all_moves << current_pos
      end
    end
    self.grow_unblocked_moves_in_dir(all_moves)
  end
  
  def grow_unblocked_moves_in_dir(moves)
    moves.each_with_index do |pos, i|
      if @board[pos].color != self.color  #if piece is enemy
        return moves.take(i+1)
      elsif @board[pos].color == self.color  #if piece is friendly
        return moves.take(i)
      end
    end
    
   return moves
  end
end