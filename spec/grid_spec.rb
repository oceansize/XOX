require 'grid'

describe Grid do

  let(:grid) { Grid.new }

  it 'should have 9 cells' do
    expect(grid.cells.length).to eq 9
  end

  it 'knows when a cell is in bounds' do
    expect(grid.cell_exist?(:A1)).to be true
  end

  it 'knows when a cell is out of bounds' do
    expect(grid.cell_exist?(:Z2)).to be false
  end

  it 'knows when a cell is empty' do
    expect(grid.cell_empty?(:A1)).to be true
  end

  it 'knows when a cell is occupied' do
    grid.cells[:B2] = :x
    expect(grid.cell_empty?(:B2)).to be false
  end

end
