require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @next_moves = children
  end

  def switch_mark
    @next_mover_mark == :x ? :o : :x
  end

  def losing_node?(evaluator)
    return true if @board.winner != evaluator
    return false if @board.winner == evaluator || @board.tied?

    if @next_mover_mark == evaluator
      @next_moves.each do |move|
        move.losing_node?(evaluator)
      end
    else
      @next_moves.each do |move|
        move.losing_node?(@next_mover_mark)
      end
    end
  end

  def winning_node?(evaluator)
    return false if @board.winner != evaluator
    return true if @board.winner == evaluator || @board.tied?

    if @next_mover_mark != evaluator
      @next_moves.each do |move|
        move.losing_node?(evaluator)
      end
    else
      @next_moves.each do |move|
        move.losing_node?(@next_mover_mark)
      end
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    empty_positions = find_empty_positions(@board)
    return nil if empty_positions.empty?
    next_boards = get_next_boards(empty_positions, @board, @next_mover_mark)
    new_nodes_mover_mark = switch_mark

    next_boards.map do |board|
      TicTacToeNode.new(board, new_nodes_mover_mark, self)
    end
    
  end

  def get_next_boards(empty_positions, board, next_mover_mark)
    boards = []

    empty_positions.each do |empty_pos|
      dup_rows = deep_dup_rows(board.rows)
      dup_board = Board.new(dup_rows)
      dup_board[empty_pos] = next_mover_mark
      boards << dup_board
    end

    boards
  end

  def find_empty_positions(board)
    empty_positions = []

    board.rows.each_with_index do |row, i|
      row.each_with_index do |col, j|
        empty_positions << [i, j] if board[[i, j]].nil?
      end
    end

    empty_positions
  end

  def deep_dup_rows(rows)
    dup_board = []

    rows.each do |row|
      if row.is_a?(Array)
        dup_board << deep_dup_rows(row)
      else
        dup_board << row
      end
    end

    dup_board
  end

end
