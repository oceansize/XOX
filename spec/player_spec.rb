require "player"

describe Player do

let(:player) { Player.new }

  it "has a name" do
    player.name = "Roi"
    expect(player.name).to eq "Roi"
  end

  it "has a default name" do
    expect(player.name).to eq "Computer"  
  end

  it "has a default marker of 'x'" do
    expect(player.marker).to eq :x
  end

  it "can have a marker set to 'o'" do
    player.marker = :o
    expect(player.marker).to eq :o
  end

end
