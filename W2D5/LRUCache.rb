class LRUCache

  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    elsif count >= @size
      @cache.shift
      @cache << el
    else
      @cache << el
    end
  end

  def show
    p @cache
  end

  private

end

test_cache = LRUCache.new(4)

test_cache.add("I walk the line")
test_cache.add(5)

test_cache.count # => returns 2

test_cache.add([1,2,3])
test_cache.add(5)
test_cache.add(-5)
test_cache.add({a: 1, b: 2, c: 3})
test_cache.add([1,2,3,4])
test_cache.add("I walk the line")
test_cache.add(:ring_of_fire)
test_cache.add("I walk the line")
test_cache.add({a: 1, b: 2, c: 3})


test_cache.show
# => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
