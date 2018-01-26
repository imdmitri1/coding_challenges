# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.


def sum_of_3_5_multiples_below(number)
  sum = 0
  number.times do |n|
    if n % 3 == 0
      sum += n
    elsif n % 5 == 0
      sum += n
    end
  end
  sum
end

p sum_of_3_5_multiples_below(1000)
