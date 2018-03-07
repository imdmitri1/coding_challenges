# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

def sum_of_primes_bellow(n)
  sum = 0
  (1...n).to_a.each { |i| sum += i if is_prime?(i) }
  sum
end

def is_prime?(num)
  return false if num <= 1
  Math.sqrt(num).to_i.downto(2) {|i| return false if num % i == 0}
  true
end

p sum_of_primes_bellow(10) == 17
p sum_of_primes_bellow(100) == 1060
p sum_of_primes_bellow(2_000_000) == 142913828922
