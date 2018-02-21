# Series
# Given a string of digits, output all the contiguous substrings of length n in that string.
#
# For example, the string "49142" has the following 3-digit series:
#
# 491
# 914
# 142
# And the following 4-digit series:
#
# 4914
# 9142
# And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.

def amount_of_substrings(string, length)
  return "none" if length > string.length || length <= 0
  result = []
  string.length.times do |i|
    result << string[i..(i + length - 1)] if string[i..(i + length - 1)].length == length
  end
  result
end

p amount_of_substrings("49142",3)
p amount_of_substrings("49142",4)
p amount_of_substrings("49142",5)
p amount_of_substrings("49142",6)
p amount_of_substrings("49142",0)
