class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable

  attr_accessor :head

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return nil if empty?
    @head.val
  end

  def last(test_link = nil)
    return nil if empty?

    test_link ||= head
    return test_link if test_link.next.nil?

    last(test_link.next)
  end

  def empty?
    @head.nil?
  end

  def get(key, test_link = nil)
    return nil if empty?

    test_link ||= head

    return test_link.val if test_link.key == key
    return nil if test_link.next.nil?

    get(key, test_link.next)
  end

  def include?(key)
    !get(key).nil?
  end

  def insert(key, val)
    last.next = Link.new(key, val)
  end

  def remove(key)
    # return nil if empty? || !include?(key)
    #
    # parent = find_parent(key)
    #   return nil if parent.nil?
    # child = find_child(key)
    #
    #  if child.nil?
    #    parent.next = nil
    #  else
    #    parent.next = child
    #  end
  end

  # def find_parent(key, test_link = nil)
  #   # find { |link| link.next && link.next.key == key }
  #   test_link ||= head
  #   if test_link.next.key == key
  #     sub_list_tail = test_link
  #   else
  #     find_parent(key, test_link.next)
  #   end
  # end
  #
  # def find_child(key, test_link = nil)
  #   test_link ||= head
  #   if test_link.next.key == key
  #     return test_link.next
  #   else
  #     find_parent(key, test_link.next)
  #   end
  # end

  def each
    # i = 0
    # prc ||= { |x| x <=> y }
    # while (1)
    #   break if self[i].nil?
    #   yield(self[i])
    #   i += 1
    # end
    return nil if empty?

    current_link = @head
    until current_link.nil?
      yield (current_link)
      current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
