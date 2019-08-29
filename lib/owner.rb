require "pry"
class Owner
  # code goes here
  #attr_accessor :cats, :dogs 
  attr_reader :name, :species
  @@all = []
  @@count = 0
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @@count += 1
  end
  def say_species
    "I am a #{self.species}."
  end
  def self.all
    @@all
  end
  def self.count
    @@count
  end
  def self.reset_all
    @@all.clear
    @@count = 0
  end
  def cats
    p = Cat.all.select do |obj|
      obj.owner == self
    end
    p
  end
  def dogs
    p = Dog.all.select do |obj|
        obj.owner == self
    end
    p
  end
  def buy_cat(name)
    c = Cat.new(name, self)
  end
  def buy_dog(name)
    d = Dog.new(name, self)
  end
  def walk_dogs
    Dog.all.map{|obj| obj.mood = "happy"}
  end
  def feed_cats
    Cat.all.map{|obj| obj.mood = "happy"}
  end
  def sell_pets
    Dog.all.map{|obj| obj.mood = "nervous"}
    Cat.all.map{|obj| obj.mood = "nervous"}
    Dog.all.map{|obj| obj.owner = nil}
    Cat.all.map{|obj| obj.owner = nil}
  end
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end