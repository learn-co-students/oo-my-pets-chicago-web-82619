require './lib/cat.rb'
require './lib/dog.rb'
require './lib/owner.rb'
require 'pry'

@owner = Owner.new("Timmy")

cat_1 = Cat.new("Garfield", @owner)
cat_2 = Cat.new("Fido", @owner)
cat_3 = Cat.new("Whiskers", @owner)

fido = Dog.new("Fido", @owner)
tabby = Cat.new("Tabby", @owner)

binding.pry

true