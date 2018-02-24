# Flatten Array
# Take a nested list and return a single flattened list with all values except nil/null.
#
# The challenge is to write a function that accepts an arbitrarily-deep nested list-like
# structure and returns a flattened structure without any nil/null values.
#
# For Example
#
# input: [1,[2,3,null,4],[null],5]
#
# output: [1,2,3,4,5]


# # can be solved with built in methods
# def flatten_array(array)
#   array.flatten!
#   array.compact!
#   array
# end

def flatten_array(array)
  i = 0
  until i == array.length
    if array[i].class == Array && array[i].length > 0
        array.insert(i,array[i].shift)
    else
      i += 1
    end
  end
  array.delete_if { |item| item == nil || item == [] }
end

p flatten_array([0, 1, 2]) == [0, 1, 2]
p flatten_array([1,[2,3,nil,4],[nil],5]) == [1,2,3,4,5]
p flatten_array([1, [2, 3, 4, 5, 6, 7], 8]) == [1, 2, 3, 4, 5, 6, 7, 8]
p flatten_array([1, [2, [[3]], [4, [[5]]], 6, 7], 8]) == [1, 2, 3, 4, 5, 6, 7, 8]
p flatten_array([0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2]) == [0, 2, 2, 3, 8, 100, 4, 50, -2]
p flatten_array([0, 2, [[2, 3], 8, [[100]], nil, [[nil]]], -2]) == [0, 2, 2, 3, 8, 100, -2]
p flatten_array([nil, [[[nil]]], nil, nil, [[nil, nil], nil], nil]) == []
