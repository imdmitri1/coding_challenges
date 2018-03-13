# Last digit of a large number
#
# Define a function
# that takes in two numbers a and b and returns the
# last decimal digit of a^b. Note that a and b may be very large!
#
# For example, the last decimal digit of 9^7 is 9, since 9^7 = 4782969.
# The last decimal digit of (2^200)^(2^300), which has over 10^92 decimal digits, is 6.
#
# The inputs to your function will always be non-negative integers.


def last_digit(n1, n2)
  n1 %= 10
  primes_array = prime_factors(n2)
  until primes_array.length == 0
    n1 = n1 ** primes_array.pop
    n1 %= 10
  end
  n1
end

def prime_factors(number)
  return [number] if number <= 2
  collection = []
  i = 2
  until number == 1
    if number % i == 0
      collection << i
      number /= i
    else
      i += 1
    end
  end
  return [number] if collection.length == 1
  collection
end

p last_digit(4,2) == 6
p last_digit(9,7) == 9
p last_digit(2,10) == 4
p last_digit(11,21) == 1
p last_digit((2**200),(2**300)) == 6
