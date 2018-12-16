class Owner
  
  attr_accessor :pets, :name
  attr_reader :species
  
  @@all = []
  @@owner_count = 0 
  
  def initialize(species)
    @pets = { fishes: [], cats: [], dogs: [] }
    @species = species
    @@all << self
    @@owner_count += 1 
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end
  
  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end
  
  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end
  
  def walk_dogs
    @pets[:dogs].map { |dog| dog.mood = "happy" }
  end
  
  def play_with_cats
    @pets[:cats].map { |cat| cat.mood = "happy" }
  end
  
  def feed_fish
    @pets[:fishes].map { |fish| fish.mood = "happy" }
  end
  
  def sell_pets
    @pets.each do |pet_type, pet_array|
      
      pet_array.collect do |pet|
        pet.mood = "nervous"
      end
      pet_array.clear
    end
  end
  
  def list_pets
    "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
  end
  
  def self.reset_all 
    @@all.clear
    @@owner_count = 0
  end
  
  def self.count 
    @@owner_count
  end
  
  def self.all
    @@all
  end
  
end