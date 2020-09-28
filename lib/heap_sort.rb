

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(1)
def heap_sort(list)
  n = list.size
  return list if n < 2

  # heap construction - reorganize original array into a maximum heap
  # proceed from right to left, starting halfway back through the array
  # O(n)
  i = (n - 1) / 2
  while i >= 0
    heap_down(list, i, n)
    i -= 1
  end

  # sort
  # remove the largest remaining item from the heap and
  # put it into the array position vacated as the heap shrinks
  # O(n log n)
  while n > 0
    list[0], list[n - 1] = list[n - 1], list[0]

    n -= 1
    heap_down(list, 0, n)

  end
  list
end


# max heap heap_down method
def heap_down(list, index, n)
  while index * 2 + 1 < n
    j = index * 2 + 1 # first child

    if j < n - 1 && list[j] < list[j + 1] # greater of two children
      j += 1
    end

    if list[index] > list[j] # stop if move will violate heap order
      break
    end

    list[index], list[j] = list[j], list[index]
    index = j
  end
end