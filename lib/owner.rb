
class Owner
  attr_reader :name, :species
  attr_writer :all
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    # binding.pry
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self }
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.select {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.select {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.select {|cat| cat.mood = "nervous"}
    self.dogs.select {|dog| dog.mood = "nervous"}
    self.cats.select {|cat| cat.owner = nil}
    self.dogs.select {|dog| dog.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end



end