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
      opts[:x_pos] = args.split(',')[0]
      opts[:y_pos] = args.split(',')[1]
      opts[:direction] = args.split(',')[2]
    end
    @walle.send(command.to_sym, opts)
  rescue
    return Answers::IDN
  end
end
