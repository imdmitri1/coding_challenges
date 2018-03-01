# You have to create a function that takes a positive integer number and
# returns the next bigger number formed by the same digits:
#
# next_bigger(12)==21
# next_bigger(513)==531
# next_bigger(2017)==2071
#
# If no bigger number can be composed using those digits, return -1:
#
# next_bigger(9)==-1
# next_bigger(111)==-1
# next_bigger(531)==-1


# find digit bigger then next one to the left, replace with any bigger digit from the right, sort everything on right
def next_bigger(n)
  return -1 if n / 10 == 0 || same_digits?(n) || biggest?(n)
  digits_array = n.to_s.chars.map(&:to_i)
  n_length = digits_array.length
  i = 1
  until i == n_length
    if digits_array[n_length - i] > digits_array[n_length - 1 - i]
      # find next bigger num from the right
      b = digits_array[(n_length - i)..-1].sort.find { |x| x > digits_array[n_length - 1 - i] }
      digits_array.insert(n_length - 1 - i, b)
      # sort everything on the right and delete inserted num
      sorted = digits_array[(n_length - i)..-1].sort!
      sorted.delete_at(sorted.index(b))
      digits_array[(n_length - i)..-1] = sorted
      return digits_array.join.to_i
    end
    i += 1
  end
end

def same_digits?(n)
  n.to_s.chars.uniq.length == 1
end

def biggest?(n)
  digits_array = n.to_s.chars.map(&:to_i)
  digits_array == digits_array.sort { |x,y| y <=> x }
end


p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(414) == 441
p next_bigger(144) == 414

p next_bigger(9) == -1
p next_bigger(111) == -1
p next_bigger(531) == -1

p next_bigger(2371) == 2713
p next_bigger(32731) == 33127
p next_bigger(33721) == 37123
p next_bigger(59884848459853) == 59884848483559

p z = rand(0..999999)
p next_bigger(z)
p y = rand(0..999999)
p next_bigger(y)
p x = rand(0..999999)
p next_bigger(x)
