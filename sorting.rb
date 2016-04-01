
#MERGE SORT ALGORITM
def arr_split(parent_array)
  #get array length
  #determine indicies
  left_length = parent_array.length / 2

  #CREATE LEFT ARRAY
  left_array = []
  #from 0 to n-1, left_array.push(arr(i))
  if left_length == 1
    left_array.push(parent_array[0])
  else
    for i in 0..(left_length-1)#INFINITE LOOP PROBLEMS HERE
      left_array.push(parent_array[i])
    end
  end
  #Splits when array length has more than one element. RECURSION STARTS HERE
  if left_array.length > 1
    left_array = arr_split(left_array)
    #run arr_split_and_sort
  end

  #CREATE RIGHT ARRAY
  right_array = []
  if parent_array.length - left_length == 1
    right_array.push(parent_array[-1])
  else
    for i in (parent_array.length - left_length - 1)..(parent_array.length - 1)
      right_array.push(parent_array[i])
    end
  end

  #Splits when array length has more than one element. RECURSION STARTS HERE
  if right_array.length > 1
    #run arr_split_and_sort
    right_array = arr_split(right_array)
  end
  #This is where the sorting begins...
  binding.pry
  prior_array = parent_array
  parent_array = arr_sort(left_array,right_array)
  #array sorted here
  binding.pry
end

def arr_sort(left_mini_array, right_mini_array)
  #binding.pry
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
  #binding.pry
end
