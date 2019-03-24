$: << File.expand_path('../lib/', __FILE__)

require 'axiom'

class Simulator < Thor

  desc 'manual_control', 'Set orders manually. Use -x -y to set the table params'
  method_option :x_axis, type: :numeric, default: 5, aliases: "-x", desc: 'Length of table'
  method_option :y_axis,  type: :numeric, default: 5, aliases: "-y", desc: 'Width of table'

  def manual_control
    say "[WALL-E]::.. HELL0 EVA. I'm WALL-E a little R0B0T. Stands ready to follow up your C0MMANDS", :MAGENTA
    table = Table.new(options[:x_axis], options[:y_axis])
    walle = Walle.new({table: table})
    eva = Eva.new(walle)
    
    loop do
      say '[WALL-E]::.. Input command (Q to quit): ', :MAGENTA
      input = STDIN.gets
      break if input =~ /q/i
      say eva.give_order(input)
    end
  end

  desc 'load_cassette [PATH TO FILE]', 'print final position of walle from a list commands from a file'
  method_option :x_axis, type: :numeric, default: 5, aliases: '-x'
  method_option :y_axis,  type: :numeric, default: 5, aliases: '-y'

  def load_cassette(filename)
    task_list = load_tasks(filename)

    table = Table.new(options[:x_axis], options[:y_axis])
    walle = Walle.new({table: table})
    eva = Eva.new(walle)

    say "cassette: #{filename}"
    task_list.each_line { |task| eva.give_order(task)}
    say "output: #{walle.report(nil)}"
  end

  no_commands do
    def load_tasks(filename)
      task_list = File.read(filename)
      task_list.gsub!(/\r\n?/, "\n")
      task_list
    end
  end
end