class Grid

  attr_reader :cells

  def initialize
    @cells = (1..9).to_a
  end

  def cell_exist?(location)
    !cells[location].nil?
  end

  def cell_empty?(location)
    cells[location].is_a? Integer
  end

end