# Luhn
# Given a number determine whether or not it is valid per the Luhn formula.
#
# The Luhn algorithm is a simple checksum formula used to validate a variety of
# identification numbers, such as credit card numbers and Canadian Social Insurance Numbers.
#
# The task is to check if a given string is valid.
#
# Validating a Number
# Strings of length 1 or less are not valid. Spaces are allowed in the input, but they should be stripped before
# checking. All other non-digit characters are disallowed.
#
# Example 1: valid credit card number
# 1
# 4539 1488 0343 6467
# The first step of the Luhn algorithm is to double every second digit, starting from the right. We will be doubling
#
# 1
# 4_3_ 1_8_ 0_4_ 6_6_
# If doubling the number results in a number greater than 9 then subtract 9 from the product. The results of our doubling:
#
# 1
# 8569 2478 0383 3437
# Then sum all of the digits:
#
# 1
# 8+5+6+9+2+4+7+8+0+3+8+3+3+4+3+7 = 80
# If the sum is evenly divisible by 10, then the number is valid. This number is valid!


def is_valid_luhn(number)
  number = number.gsub(/\s+/, "")
  return false if number.length <= 1 || number.length != number.delete("^0123456789").length
  number_array = number.chars.map(&:to_i)
  i = number_array.length - 2
  until i < 0
    if number_array[i] * 2 > 9
      number_array[i] = number_array[i] * 2 - 9
    else
      number_array[i] = number_array[i] * 2
    end
    i -= 2
  end
  result = number_array.reduce('+')
  result % 10 == 0 ? true : false
end


# valid
p is_valid_luhn("4539 1488 0343 6467")
p is_valid_luhn("59")
p is_valid_luhn("055 444 285")

# invalid
p is_valid_luhn("055a 444$ 285") == false
p is_valid_luhn("055-444-285") == false
p is_valid_luhn("8273 1232 7352 0569") == false
