class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n) - worst case, when need heap-up, O(1) - best case
  # Space Complexity: O(log n) - worst case, when need heap-up, O(1) - best case
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store << new_node
    heap_up(@store.size-1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def remove()
    return if @store.empty?
    if @store.size == 1
      return @store.pop
    end
    # swap the first and the last element in the underlying array
    @store[-1], @store[0] = @store[0], @store[-1]
    removed = @store.pop
    heap_down(0)
    return removed.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(log n)
  def heap_up(index)
    # base case
    parent_index = (index - 1) / 2
    return if parent_index < 0 || @store[index].key >= @store[parent_index].key

    # swap
    @store[index], @store[parent_index] = @store[parent_index], @store[index]
    # recursive case
    heap_up(parent_index)
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    n = @store.size
    while index * 2 + 1 < n
      j = index * 2 + 1

      j += 1 if j < n - 1 && @store[j + 1].key < @store[j].key

      break if @store[index].key <= @store[j].key

      @store[index], @store[j] = @store[j], @store[index]
      index = j
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end