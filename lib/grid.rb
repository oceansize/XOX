class Grid

  attr_reader :cells

  def initialize
    @cells = {
               A1: :~, A2: :~, A3: :~,
               B1: :~, B2: :~, B3: :~,
               C1: :~, C2: :~, C3: :~
             }
  end

  def cell_exist?(location)
    cells.has_key?(location)
  end

  def cell_empty?(location)
    cells[location] == :~
  end

end
