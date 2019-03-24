# frozen_string_literal: true

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

  def report(_opts)
    Command.new(self).report
  end

  def left(_opts)
    Command.new(self).left
  end

  def right(_opts)
    Command.new(self).right
  end

  def move(_opts)
    Command.new(self).move
  end

  def placed?
    [x_pos, y_pos, direction, index].none?(&:nil?)
  end
end
