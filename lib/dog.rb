class Dog
  @@all = []
  attr_accessor :owner, :mood
  attr_reader :name
  def initialize(name,owner)
    @name = name
    self.owner = owner
    self.mood = "nervous"
    self.class.all << self
  end

  def self.all
    @@all
  end
end