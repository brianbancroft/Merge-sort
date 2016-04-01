#merge sort
def arr_split(arr)
  #get array length
  #determine indicies
  left_length = arr.length / 2

  #place arrays into left and right arrays
  left_array = []
  #from 0 to n-1, left_array.push(arr(i))
  for i in 0..(left_length - 1)
    left_array.push(arr[i])
  if left_array.length >1 
    left_array = arr_split(left_array)
    #run arr_split_and_sort
  end


  right_array = []
  for i in (arr.length - left_length - 1)..(arr.length - 1)
    right_array.push(arr[i])
  #from n to arr.length, right_array.push(arr(i))
  if right_array.length > 1
    #run arr_split_and_sort
    right_array = arr_split(right_array)
  end
  arr = arr_sort(left_array,right_array,arr)

end

def arr_sort(l_arr, r_arr, main_arr)
  #declare indices
  l_ind = 0
  r_ind = 0
  arr_ind = 0

  while (l_ind < l_arr.length && r_ind < r_arr.length)
    if l_arr[l_ind] < r_arr[r_ind]
      arr[arr_ind] = l_arr[l_ind]
      l_ind = l_ind + 1
      arr_ind = arr_ind + 1
    else
      arr[arr_ind] = r_arr[r_ind] 
      r_ind = r_ind + 1
      arr_ind = arr_ind + 1
    end
  end

  while (l_ind < l_arr.length)
    arr[arr_ind] = l_arr[l_ind]
    l_ind = l_ind + 1
    arr_ind = arr_ind + 1
  end

  while (r_ind < r_arr.length)
    arr[arr_ind] = r_arr[r_ind] 
    r_ind = r_ind + 1
    arr_ind = arr_ind + 1
  end
end


def sort(arr)
  array_length = arr.length

  if array_length < 2
    #This doesn't even justify a merge sort. Bye-bye, buckaroo!
  else
    arr = arr_split(arr)
  end
end

# Find the maximum 
def maximum(arr)
  sort(arr).last
end

def minimum(arr)
  sort(arr).first
end
 
# expect it to return 42 below
result = maximum([2, 42, 22, 02])
puts "max of 2, 42, 22, 02 is: #{result}"

# expect it to return 2 below
result = minimum([2, 42, 22, 02])
puts "min of 2, 42, 22, 02 is: #{result}"

 
# expect it to return nil when empty array is passed in
result = maximum([])
puts "max on empty set is: #{result.inspect}"
result = minimum([])
puts "min on empty set is: #{result.inspect}"
 
result = maximum([-23, 0, -3])
puts "max of -23, 0, -3 is: #{result}"
 
result = maximum([6])
puts "max of just 6 is: #{result}"
