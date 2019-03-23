# frozen_string_literal: true

class Command < ClassyEnum::Base
  COMMANDS = %w[left right move place report].freeze

  attr_accessor :walle

  def execute_order; end
end

class Command::Left < Command
  def execute_order(args = nil); end
end

class Command::Right < Command
  def execute_order(args = nil); end
end

class Command::Move < Command
  def execute_order(args = nil); end
end

class Command::Place < Command
  def execute_order(args = nil); end
end

class Command::Report < Command
  def execute_order(args = nil); end
end
