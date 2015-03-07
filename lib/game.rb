class Game

  attr_reader :player_1, :player_2, :turn, :grid

  WINNING_COMBOS = {
    top_row: [0,1,2],
    middle_row: [3,4,5],
    bottom_row: [6,7,8],
    left_col: [0,3,6],
    middle_col: [1,4,7],
    right_col: [2,5,8],
    left_right_diag:[0,4,8],
    right_left_diag: [2,4,6]
  }

  def initialize(grid)
    @ready = false
    @grid = grid
  end

  def ready?
    !@player_2.nil?
  end

  def add_player(player)
    @player_1 ? @player_2 = player : @player_1 = player
    @turn = player_1
  end

  def switch_turn
    @turn == player_1 ? @turn = player_2 : @turn = player_1
  end

  def go(location, player)
    raise "Player Two missing!" unless ready?
    raise "Game Over!" if winner?
    grid.cells[location] = player.marker
    switch_turn
  end

  def winner?(player)
    WINNING_COMBOS.each_value do |combo|
      row_to_inspect = grid_slicer(combo)
      return true if row_filled_by_same?(player, row_to_inspect)
    end
    return false
  end

  def grid_slicer(row)
    grid.cells[row.first..row.last]
  end

  def row_filled_by_same?(player, row)
    row.uniq.count == 1 && row.first == player.marker
  end

end
