# frozen_string_literal: true

class Command
  attr_accessor :walle

  def initialize(walle)
    @walle = walle
  end

  def place(opts)
    x_pos = opts[:x_pos].to_i
    y_pos = opts[:y_pos].to_i
    direction = opts[:direction].upcase

    return Answers::INVALID_DIRECTION unless Map.in_map?(direction)

    return Answers::INVALID_POSITION if Map.out_of_map?(@walle.table, x_pos) || Map.out_of_map?(@walle.table, y_pos)

    @walle.x_pos = x_pos
    @walle.y_pos = y_pos
    @walle.index = Map.find_index(direction)
    @walle.direction = direction.to_sym

    Answers::GOOD_JOB
  end

  def report
    return Answers::NOT_PLACED unless @walle.placed?

    "#{walle.x_pos},#{walle.y_pos},#{walle.direction}"
  end

  def left
    return Answers::NOT_PLACED unless @walle.placed?

    @walle.index = Map.calculate_index(@walle.index - 1)
    @walle.direction = Map.get_direction(@walle.index).to_sym

    Answers::GOOD_JOB
  end

  def right
    return Answers::NOT_PLACED unless @walle.placed?

    @walle.index = Map.calculate_index(@walle.index + 1)
    @walle.direction = Map.get_direction(@walle.index)

    Answers::GOOD_JOB
  end

  def move
    return Answers::NOT_PLACED unless @walle.placed?

    signal = Map.get_signal(@walle.direction.to_sym)
    step = 1 # Need to check if it is negative
    axis_value = @walle.send(signal[:axis]).send(signal[:object], step)

    return Answers::INVALID_POSITION if Map.out_of_map?(@walle.table, axis_value)

    # Maybe looks strange but it is the similar:
    # @walle.y_pos = 1
    @walle.send("#{signal[:axis]}=", axis_value)

    Answers::GOOD_JOB
  end
end
