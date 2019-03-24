class Walle
  attr_accessor :table, :x_pos, :y_pos, :direction, :index

  def initialize(opts = {})
    @table = opts[:table]
    @x_pos = nil
    @y_pos = nil
    @direction = nil
    @index = nil
  end

  def place(opts = nil)
    Command.new(self).place(opts)
  end

  def report
    Command.new(self).report
  end

  def left
    Command.new(self).left
  end

  def right
    Command.new(self).right
  end

  def move
    Command.new(self).move
  end

  def placed?
    [x_pos, y_pos, direction, index].none?(&:nil?)
  end

end