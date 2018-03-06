# Below we will define an n-interesting polygon. Your task is to find the area of a polygon for a given n.
#
# A 1-interesting polygon is just a square with a side of length 1. An n-interesting polygon is obtained by
# taking the n - 1-interesting polygon and appending 1-interesting polygons to its rim, side by side. You can
# see the 1-, 2-, 3- and 4-interesting polygons in the picture below.
#
#
# []

#   []
# [][][]
#   []

#     []
#   [][][]
# [][][][][]
#   [][][]
#     []

#       []
#     [][][]
#   [][][][][]
# [][][][][][][]
#   [][][][][]
#     [][][]
#       []
#
# Example
#
# For n = 2, the output should be
# shape_area(n) = 5;
# For n = 3, the output should be
# shape_area(n) = 13.

def shape_area(n)
  return 0 if n == 0
  area = n ** 2 + (n - 1) ** 2
  i = 1
  until i > n * 2 - 1
    if i <= n
      puts "\s" * (n - i) * 2 + "[]" * (n - (n - i)) + "[]" * (n - (n - i) - 1) + "\s" * (n - i) * 2
    else
      puts "\s" * ((n - i) * -1) * 2 + "[]" * (n - ((n - i) * -1)) + "[]" * (n - ((n - i) * -1) - 1) + "\s" * ((n - i) * -1) * 2
    end
    i += 1
  end
  puts "Shape area = #{area}"
  area
end

shape_area(1)
shape_area(2)
shape_area(3)
shape_area(4)
shape_area(5)
shape_area(15)
