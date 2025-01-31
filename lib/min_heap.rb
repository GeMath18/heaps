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
  # Time Complexity: O(log(n))
  # Space Complexity: O(log(n))
  def add(key, value = key)
    # raise NotImplementedError, "Method not implemented yet..."
    @store << HeapNode.new(key, value)

    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log(n))
  # Space Complexity: O(log(n))
  def remove()
    # raise NotImplementedError, "Method not implemented yet..."
    if @store.empty?
      return nil
    end

    swap(0, @store.length - 1)
    result = @store.pop.value

    heap_down(0) unless @store.empty?
    return result

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
    # raise NotImplementedError, "Method not implemented yet..."
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log(n))
  # Space complexity: O(log(n))
  def heap_up(index)
    return nil if index == 0

    parent_index = (index - 1)/ 2

    if @store[index].key < @store[parent_index].key
      swap(index, parent_index)
      heap_up(parent_index)
    else
      return nil
    end

  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    # raise NotImplementedError, "Method not implemented yet..."
    left_child = (index * 2) + 1
    right_child = (index * 2) + 2

    return @store if @store[left_child].nil? || @store[right_child].nil?

    if @store[left_child].key < @store[index].key
      swap(left_child, index)
      heap_down(left_child)
    end

    if @store[right_child].key < @store[index].key
      swap(right_child, index)
      heap_down(right_child)
    end

  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end