class Game

  attr_reader :player_1, :player_2, :turn, :grid

  WINNING_COMBOS = [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]

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

  def winner? player
    Game::WINNING_COMBOS.each do |combo|
      # iterates over the combo to compare to grid
      
      row_contents = marker_counter_in(row_of_three)
      return true if row_contents[player.marker] == 3
    end
    return false
  end

end

private

def marker_counter_in(row_of_three)
  marker_count = Hash.new 0
  row_of_three.each { |cell_content| marker_count[cell_content] += 1 }
  marker_count
end
