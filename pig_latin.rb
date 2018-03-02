# Move the first letter of each word to the end of it, then add "ay" to the
# end of the word. Leave punctuation marks untouched.
#
# Examples
# pig_it('Pig latin is cool') # igPay atinlay siay oolcay
# pig_it('Hello world !')     # elloHay orldWay !

def pig_it text
  text.split(' ').map { |word| (word =~ /[a-zA-Z]/) ? word + word.slice!(0) + "ay" : word }.join(' ')
end


p pig_it('Pig latin is cool') == "igPay atinlay siay oolcay"
p pig_it('Hello world !') == "elloHay orldway !"
p pig_it('This is my string') == 'hisTay siay ymay tringsay'
