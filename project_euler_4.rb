def largest_palindrome(n=3)
  return "1-digit cannot be a palindrome" if n == 1
  biggest_n_digit_number = (10 ** n - 1)
  smallest_n_digit_number = (10 ** (n-1))
  product = biggest_n_digit_number ** 2
  while product
    if is_palindrome?(product)
      multiplier = product / biggest_n_digit_number
      if product % biggest_n_digit_number == 0 && (multiplier).to_s.length == n
        return "palindrome #{product} is product of #{n}-digit numbers: #{biggest_n_digit_number} and #{multiplier}"
      else
        if biggest_n_digit_number > smallest_n_digit_number
          biggest_n_digit_number -= 1
        else
          product -= 1
          biggest_n_digit_number = (10 ** n - 1)
        end
      end
    else
      product -= 1
    end
  end
end

def is_palindrome?(num)
  string = num.to_s
  length = string.length
  return true if length.even? && string[0...(length / 2)] == string[(length / 2)..-1].reverse
  false
end

p largest_palindrome()
"palindrome 9009 is product of 2-digit numbers: 99 and 91"
"palindrome 906609 is product of 3-digit numbers: 993 and 913"
"palindrome 99000099 is product of 4-digit numbers: 9999 and 9901"
"palindrome 9966006699 is product of 5-digit numbers: 99979 and 99681"


# require 'benchmark'
# Benchmark.bm do |calculate|
#   calculate.report("2-dgit") { largest_palindrome(2) }
#   calculate.report("3-dgit") { largest_palindrome(3) }
#   calculate.report("4-dgit") { largest_palindrome(4) }
#   calculate.report("5-dgit") { largest_palindrome(5) }
# end
#
# # 2-dgit  0.010000   0.000000   0.010000 (  0.001967)
# # 3-dgit  0.150000   0.000000   0.150000 (  0.151548)
# # 4-dgit  1.620000   0.010000   1.630000 (  1.626573)
# # 5-dgit 58.110000   0.070000  58.180000 ( 58.330466)
