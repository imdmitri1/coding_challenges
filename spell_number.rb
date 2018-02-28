# Say
# Given a number from 0 to 999,999,999,999, spell out that number in English.
# Step 1
# Handle the basic case of 0 through 99.
#
# If the input to the program is 22, then the output should be 'twenty-two'.
#
# Your program should complain loudly if given a number outside the blessed range.
#
# Some good test cases for this program are:
#
# 0
# 14
# 50
# 98
# -1
# 100
# Extension
# If you're on a Mac, shell out to Mac OS X's say program to talk out loud.
#
# Step 2
# Implement breaking a number up into chunks of thousands.
#
# So 1234567890 should yield a list like 1, 234, 567, and 890, while the far simpler 1000 should yield just 1 and 0.
#
# The program must also report any values that are out of range.
#
# Step 3
# Now handle inserting the appropriate scale word between those chunks.
#
# So 1234567890 should yield '1 billion 234 million 567 thousand 890'
#
# The program must also report any values that are out of range. It's fine to stop at "trillion".
#
# Step 4
# Put it all together to get nothing but plain English.
#
# 12345 should give twelve thousand three hundred forty-five.
#
# The program must also report any values that are out of range.
#
# Extensions
# Use and (correctly) when spelling out the number in English:
#
# 14 becomes "fourteen".
# 100 becomes "one hundred".
# 120 becomes "one hundred and twenty".
# 1002 becomes "one thousand and two".
# 1323 becomes "one thousand three hundred and twenty-three".
#


def spell_one_nine(num)
  case num
  when 1
    "one"
  when 2
    "two"
  when 3
    "three"
  when 4
    "four"
  when 5
    "five"
  when 6
    "six"
  when 7
    "seven"
  when 8
    "eight"
  when 9
    "nine"
  end
end

def spell_ten_nineteen(num)
  case num
  when 10
    "ten"
  when 11
    "eleven"
  when 12
    "twelve"
  when 13
    "thirteen"
  when 14
    "fourteen"
  when 15
    "fifteen"
  when 16
    "sixteen"
  when 17
    "seventeen"
  when 18
    "eighteen"
  when 19
    "nineteen"
  end
end

def spell_tens(num)
  case num
  when 2
    "twenty"
  when 3
    "thirty"
  when 4
    "forty"
  when 5
    "fifty"
  when 6
    "sixty"
  when 7
    "seventy"
  when 8
    "eighty"
  when 9
    "ninety"
  end
end

def spell_one_ninety_nine(num)
  if num / 10 >= 2
    "#{spell_tens(num / 10)} #{spell_one_nine(num % 10)}"
  elsif num / 10 == 1
    spell_ten_nineteen(num)
  else
    spell_one_nine(num)
  end
end

def spell_one_to_999(num)
  if num / 100 > 0
    "#{spell_one_nine(num / 100)} hundred and #{spell_one_ninety_nine(num % 100)}"
  else
    spell_one_ninety_nine(num)
  end
end

def spell_upto_million(num)
  if num / 1_000 > 0
    "#{spell_one_to_999(num / 1_000)} thousand #{spell_one_to_999(num % 1_000)}"
  else
    spell_one_to_999(num)
  end
end

def spell_upto_billion(num)
  if num / 1_000_000 > 0
    "#{spell_one_to_999(num / 1_000_000)} million #{spell_upto_million(num % 1_000_000)}"
  else
    spell_upto_million(num)
  end
end

def spell_upto_trillion(num)
  return "zero" if num == 0
  return "outside of range" unless (0..999_999_999_999).include?(num)
  if num / 1_000_000_000 > 0
    "#{spell_one_to_999(num / 1_000_000_000)} billion #{spell_upto_billion(num % 1_000_000_000)}"
  else
    spell_upto_billion(num)
  end
end

p spell_upto_trillion(ARGV[0].to_i) if ARGV[0]

p "********** 10 random numbers ************"
p a = rand(0..99)
p spell_upto_trillion(a)
p b = rand(0..999)
p spell_upto_trillion(b)
p c = rand(0..99_999)
p spell_upto_trillion(c)
p d = rand(0..999_999)
p spell_upto_trillion(d)
p e = rand(0..9_999_999)
p spell_upto_trillion(e)
p f = rand(0..99_999_999)
p spell_upto_trillion(f)
p j = rand(0..9_999_999_999)
p spell_upto_trillion(j)
p g = rand(0..99_999_999_999)
p spell_upto_trillion(g)
p i = rand(0..999_999_999_999)
p spell_upto_trillion(i)
p k = rand(0..999_999_999_999)
p spell_upto_trillion(k)
