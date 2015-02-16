require 'grid'

describe Grid do

  let(:grid) { Grid.new }

  it 'should have 9 cells' do
    expect(grid.cells.length).to eq 9
  end

  it 'knows when a cell is in bounds' do
    expect(grid.cell_exist?(8)).to be true
  end

  it 'knows when a cell is out of bounds' do
    expect(grid.cell_exist?(9)).to be false
  end

  it 'knows when a cell is empty' do
    expect(grid.cell_empty?(0)).to be true
  end

  it 'knows when a cell is occupied' do
    grid.cells[0] = :x
    expect(grid.cell_empty?(0)).to be false
  end

end
