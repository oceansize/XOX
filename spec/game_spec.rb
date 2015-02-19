require 'game'

describe Game do
  let(:game){Game.new(grid)}
  let(:grid){double :grid, cells: (1..9).to_a }
  let(:player_1){double :player_1, marker: :x }
  let(:player_2){double :player_2}

# add test for grid

  it "knows when it's not ready to play" do
    expect(game.ready?).to be false
  end

  it "can be ready when there are two players" do
    game.add_player(player_1)
    game.add_player(player_2)
    expect(game).to be_ready
  end

  it "can have a player" do
    game.add_player(player_1)
    expect(game.player_1).to eq player_1
  end

  it "can have two players" do
    game.add_player(player_1)
    game.add_player(player_2)
    expect(game.player_2).to eq player_2
  end

  it "cannot begin unless there are two players" do
    game.add_player(player_1)
    expect{ game.go(0, player_1) }.to raise_error
  end

  context "When the game is ready" do

    before do
      game.add_player(player_1)
      game.add_player(player_2)
    end

    it "knows who's turn it is" do
      expect(game.turn).to eq player_1
    end

    it "should be able to switch turns" do
      game.switch_turn
      expect(game.turn).to eq player_2
    end

    it "should be able to receive a go" do
      allow(game).to receive(:winner?)
      expect(grid.cells).to receive(:[]=).with 0, player_1.marker
      game.go(0, player_1)
    end

    it "should switch turns after a go" do
      allow(game).to receive(:winner?)
      game.go(0, player_1)
      expect(game.turn).to eq player_2
    end

    it "should check if there is a winner when taking a go" do
      expect(game).to receive(:winner?)
      game.go(0, player_1)
    end

    it "should raise an error if there is a winner" do
      allow(game).to receive(:winner?).and_return true
      expect{ game.go(0, player_1) }.to raise_error("Game Over!")
    end

    it "should know if there is not a winner" do
      expect(game.winner?(player_1)).to be false
    end

    it "should know if there is a winner" do
      rigged_layout = [player_1, player_1, player_1, 4, 5, 6, 7, 8, 9]
      expect(grid).to receive(:cells).and_return(rigged_layout)
      expect(game.winner?(rigged_layout)).to be true
    end

  end


end
