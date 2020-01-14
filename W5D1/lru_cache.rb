class LRUCache
  def initialize(max)
    @max = max
    @hash = Hash.new
    @store = []
    @count = 0
  end

  def count
    @count
  end

  def add(el)
    if @hash[el]
      @store.delete(el)
      @store.push(el)
      el
    else
      @hash[el] = true
      @store.push(el)
      @count += 1

      if @count > @max
        @hash.delete(@store.first)
        @store.shift
        @count -= 1
      end

      el
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    i = @count -1
    display = []
    until i < 0
      display << @store[i]
      i -= 1
    end
    p display
  end

  private
  # helper methods go here!

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]