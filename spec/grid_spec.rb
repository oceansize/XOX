require 'grid'

describe Grid do

  it 'should have 9 cells' do
    grid = Grid.new
    expect(grid.cells.length).to eq 9
  end

end
