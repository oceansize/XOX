class Grid

  attr_reader :cells

  def initialize
    @cells = [1,2,3,4,5,6,7,8,9]
  end

  def cell_exist?(location)
    !cells[location].nil?
  end

  def cell_empty?(location)
    cells[location].is_a? Integer
  end

end
