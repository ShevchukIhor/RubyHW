
class Animal
  attr_accessor :mood
  attr_accessor :life
  attr_accessor :hungry_level
  attr_accessor :sleep
  attr_accessor :poop

  def initialize(name)
    @name = name
    @mood = 50
    @life = 3
    @hungry_level = 50
    @sleep = false
    @poop = 50
  end

  def help
    p	"feed -- нагодувати тваринку"
    p "sleep -- вкласти спати"
    p "play -- погратись"
    p "poop -- відвести тваринку на горшок"
    p "clean -- прибрати після того як тваринка сходила на горшок"
    p "clearPetSpot -- прибрати місце відпочинку"
    p "cleatPlateAfterFeed -- помити посуд після годування"
    p "washedPet -- покупати тварину"
    p "caressPet -- погладити тваринку"
    p "wearPetBeforeWalk -- вдягти для вигулу"
    p "status -- нічого не робитиб, спостерігати"
    p "введіть обрану команду"
  end

end
p "Для почтаку давайте назвемо вашу тваринку"
pet_name = gets.chomp
pet = Animal.new(pet_name)
=begin
puts "Для початку гри напишіть слово run"
input = gets
if input == "run"
  p "Давайте дамо і'мя вашій тваринці"
  pet_name = gets.to_s
  pet = Animal.new(pet_name)
  p 'Вашу тваринку створено, давайте подивимось, що можна з ним робити'
  p "Напишіть команду help для виводу всіх доступних команд"
end
=end
p "Добре вашу тваринку звати #{pet_name}"
p "Напишіть команду help для виводу всіх доступних команд"

loop do
user_input = gets.to_s.downcase.chomp
counter = 0
  if user_input == 'help'
    pet.help
  elsif user_input == "feed"
    pet.feed
  elsif user_input == "sleep"
    pet.sleep
  elsif user_input == "play"
    pet.play
  elsif user_input == "poop"
    pet.poop
  elsif user_input == "clean"
    pet.clean
  elsif user_input == "clearPetSpot"
    pet.clearPetSpot
  elsif user_input == "clearPlateAfterFeed"
    pet.clearPlateAfterFeed
  elsif user_input == "washedPet"
    pet.washedPet
  elsif user_input == "caressPet"
    pet.caressPet
  elsif user_input == "wearPetBeforeWalk"
    pet.wearPetBeforeWalk
  elsif user_input == "status"
    pet.status
  else
    p "Введіть вірну команду або для довідки введіть help"
    counter += 1
    if counter > 10
      break
    end
  end
end

