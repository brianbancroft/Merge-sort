
#MERGE SORT ALGORITM
def arr_split(in_array)
  #setup transfer arrays
  parent_array = in_array
  right_array = parent_array
  left_array = []
  for i in 1..(parent_array.length/2)
    left_array.push(right_array.shift)
  end

  #Splits when array length has more than one element. RECURSION STARTS HERE
  if left_array.length > 1
    left_array = arr_split(left_array)
  end
  if right_array.length > 1
    #run arr_split_and_sort
    right_array = arr_split(right_array)
  end
  #End of the parts where the recursion happens

  #This is where the sorting begins...
  parent_array = arr_sort(left_array,right_array)
  #array sorted here
  test_new = parent_array
end

def arr_sort(left_mini_array, right_mini_array)
  return_array = []
  while ( left_mini_array.length > 0 && right_mini_array.length > 0)
    if left_mini_array[0] < right_mini_array[0]
      return_array.push(left_mini_array.shift)
    else
      return_array.push(right_mini_array.shift)
    end
  end

  while (left_mini_array.length > 0)
    return_array.push(left_mini_array.shift)
  end

  while (right_mini_array.length > 0)
    return_array.push(right_mini_array.shift)
  end
  return return_array
end
