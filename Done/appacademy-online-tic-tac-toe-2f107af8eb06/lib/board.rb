class Board
  attr_reader :grid, :marks

  def self.blank_grid
    Array.new(3){Array.new(3)}
  end

  def initialize(grid = Board.blank_grid)
    @grid = grid
    @marks = [:X, :O]
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def place_mark(pos, mark)
    self[pos] = mark
  end

  def empty?(pos)
    self[pos].nil?
  end

  def column
    col = [[], [], []]
    grid.each do |row|
      row.each_with_index do |mark, col_i|
        col[col_i] << mark
      end
    end
    col
  end

  def diagonal
    left = [[0, 0], [1, 1], [2, 2]]
    right = [[0, 2], [1, 1], [2, 0]]

    [left, right].map do |diag|
      diag.map{|row, col| grid[row][col]}
    end
  end

  def winner
    (grid + column + diagonal).each do |match3|
      return :X if match3 == [:X, :X, :X]
      return :O if match3 == [:O, :O, :O]
    end

    nil
  end

  def over?
    grid.flatten.none? {|pos| pos.nil?} || winner
  end
end
