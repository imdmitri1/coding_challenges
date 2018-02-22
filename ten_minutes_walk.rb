# You live in the city of Cartesia where all roads are laid out in a perfect grid.
# You arrived ten minutes too early to an appointment, so you decided to take the
# opportunity to go for a short walk. The city provides its citizens with a Walk
# Generating App on their phones -- everytime you press the button it sends you
# an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']).
# You know it takes you one minute to traverse one city block, so create a function that
# will return true if the walk the app gives you will take you exactly ten minutes (you
# don't want to be early or late!) and will, of course, return you to your starting
# point. Return false otherwise.
# Note: you will always receive a valid array containing a random assortment of direction
# letters ('n', 's', 'e', or 'w' only). It will never give you an empty array
# (that's not a walk, that's standing still!).

def is_valid_walk(walk)
  x_axis,y_axis = 0, 0
  walk.each do |direction|
    if direction == "n"
      x_axis += 1
    elsif direction == "w"
      y_axis -= 1
    elsif direction == "s"
      x_axis -= 1
    elsif direction == "e"
      y_axis += 1
    end
  end
  (x_axis == 0 && y_axis == 0) ? true : false
end


p is_valid_walk(["n","w","e","s","n","w","e","s","s","n"])
p is_valid_walk(["n","w","e","s","n","w","e","s","s","n"].shuffle)
p is_valid_walk(["n","n","n","n","n","n","n","n","n","n"]) == false
