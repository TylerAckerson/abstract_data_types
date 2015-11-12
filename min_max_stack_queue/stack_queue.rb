require_relative 'stack'

class StackQueue
  def initialize
    @in = Stack.new
    @out = Stack.new
  end

  def enqueue(value)
    @in.push(value)
  end

  def dequeue
    queuify if @out.empty?

    @out.pop
  end

  def size
    @in.size + @out.size
  end

  def empty?
    @in.empty? && @out.empty?
  end

  private

  def queuify
    @out.push(@in.pop) until @in.empty?
  end
end
