require 'pry'
class Owner
  @@all = []
  attr_reader :name, :species
  def initialize(name)
    @name = name
    @species = "human"
    self.class.all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all 
  end
  def self.count
    self.all.count
  end
  def self.reset_all
    @@all.clear
  end


  def cats
    Cat.all.select {|cat|cat.owner == self}
  end
  def dogs
    Dog.all.select {|dog|dog.owner == self}
  end
  def buy_cat(cat_str)
    # Cat.all.find {|cat|cat.name == cat_str}.owner = self
    Cat.new(cat_str,self)
  end

  def buy_dog(dog_str)
    # dog = Dog.all.find {|dog|dog.name == dog_str} != nil ? Dog.all.find {|dog|dog.name == dog_str} : 
    Dog.new(dog_str,self) 
    # dog.owner = self
    # # binding.pry
  end

  def walk_dogs
    dogs.each {|dog|dog.mood = "happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = [self.dogs,self.cats]
    pets.each do |animal|
      animal.each do|pet|
        pet.owner = nil
        pet.mood = "nervous"
      end
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end