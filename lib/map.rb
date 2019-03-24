module Map
  class << self
    MAP = {
        NORTH: { y_pos: :+ }, EAST: { x_pos: :+ }, SOUTH: { y_pos: :- }, WEST:  { x_pos: :- }
    }.freeze

    def in_map?(direction)
      MAP.keys.include?(direction.upcase)
    end

    def out_of_map?(table, coordinate)
      coordinate.negative? || coordinate > (table.x_axis - 1) || coordinate > (table.y_axis - 1) ?
          true : false
    end

    def find_index(direction)
      MAP.find_index { |k,_| k== direction.to_sym }
    end
    
    def calculate_index(index)
      index % MAP.size
    end

    def calculate_index_right(index)
      (index - 1) % MAP.size
    end
    
    def get_direction(index)
      MAP.keys[index]
    end
    
    def get_signal(direction)
      axis = MAP[direction].keys[0]
      { axis: axis, object: MAP[direction][axis] }
    end
  end
end