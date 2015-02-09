require "player"

describe Player do

  it "has a default marker of 'x'" do
    player = Player.new
    expect(player.marker).to eq :x
  end

  it "can have a marker set to 'o'" do
    player = Player.new :o
    expect(player.marker).to eq :o
  end

end
