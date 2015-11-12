require_relative 'min_max_stack'

class MinMaxStackQueue
  def initialize
    @in = MinMaxStack.new
    @out = MinMaxStack.new
  end

  def enqueue(value)
    @in.push(value)
  end

  def dequeue
    queueify if @out.empty?

    @out.empty? ? nil : @out.pop
  end

  def max
    maxes = []
    maxes << @in.max unless @in.empty?
    maxes << @out.max unless @out.empty?

    maxes.max
  end

  def min
    mins = []
    mins << @in.min unless @in.empty?
    mins << @out.min unless @out.empty?

    mins.min
  end

  private
  def queueify
    @out.push(@in.pop) until @in.empty?
  end
end
