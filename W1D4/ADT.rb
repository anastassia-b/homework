# DIY ADTs

# Exercise 1 - Stack
# To test that your code works, create a new instance of the Stack class,
# and play around with adding and removing elements.
# Remember, a stack follows the principle of LIFO!

class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end


# Exercise 2 - Queue

# Now let's write a Queue class. We will need the following instance methods:
# enqueue(el), dequeue, and show.
# Test your code to ensure it follows the principle of FIFO.

class Queue
  def initialize
    @queue = []
  end

  def dequeue
    @queue.pop
  end

  def enqueue(el)
    @queue.unshift(el)
    el
  end

  def show
    @queue.dup
  end

end


# Exercise 3 - Map

# A map can be implemented using a 2D array. Let's write a Map class (following a
# similar pattern to Stack and Queue) that implements a map using only arrays.
# Remember, a map stores information in key-value pairs, where the keys are always unique.
# When implemented with arrays, a map might look something like this:
# my_map = [[k1, v1], [k2, v2], [k3, v2], ...].

# Our Map class should have the following instance methods: assign(key, value), lookup(key),
# remove(key), show. Note that the assign method can be used to either create a new
# key-value pair or update the value for a pre-existing key. It's up to you to check
# whether a key currently exists!

# As always, test your code thoroughly to make sure all properties of maps are enforced.

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    pair_index = @map.index {|pair| pair[0] == key}
    if pair_index
      @map[pair_index][1] = value
    else
      @map.push([key, value])
    end
  end

  def lookup(key)
    @map.each {|pair| return pair[1] if pair[0] == key}
    nil
  end

  def remove(key)
    @map.reject {|pair| pair[0] == key}
    nil
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end

end
