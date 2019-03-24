class Eva
  def initialize(walle)
    @walle = walle
  end

  def give_order(command = nil)
    return if command.nil?
    command, args = command.chomp.split(' ')
    command = command.downcase
    return Answers::INVALID_INPUT unless %w[left right move place report].include?(command)
    opts = {}
    if args
      return Answers::INVALID_INPUT if args&.split(',')&.count != 3 # oh! magic numbers
      
      x_pos, y_pos, direction = args.split(',').map(&:strip)
      opts[:x_pos] = x_pos.to_i
      opts[:y_pos] = y_pos.to_i
      return Answers::INVALID_INPUT unless %w[north south west east].include?(direction.downcase)
      opts[:direction] = direction.upcase.to_sym
      
    end
    @walle.send(command.to_sym, opts)
  rescue
    return Answers::IDN
  end
end
