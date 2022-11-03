
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

  def feed
    p "Ви кормите #{@name}(а)."
    @mood += 5
    @hungry_level += 5
    lifeTime
  end

  def sleep
    p "Ви вкладаєте #{@name}(а) спати."
    @sleep = true
    3.times do
      if @sleep
        lifeTime
      end
      if @sleep
        p "#{@name} гучно сопе ..."
      end
    end
    if @sleep
      @sleep = false
      p "#{@name} повільно прокидається."
    end
  end

  def play
    p "Ви вийшли на прогулянку з #{@name}(м)."
    @poop += 5
    @mood += 5
    @hungry_level -= 1
    lifeTime

  end

  def poop
    @poop -= 3
    p "Прийшов час опорожнити кишечник і #{@name} потрібно відвести в відповідне місце"
    p "Потрібно прибрати за #{@name}(м)."
    lifeTime
  end

  def clean
    p "Ви прибираєте купу після того як #{@name} опорожнив свій кишечник"
    lifeTime
  end

  def clearPetSpot
    p "прибираєте улюблене місце сну вашого #{@name}(а)"
    lifeTime
  end

  def cleatPlateAfterFeed
    p "Необхідно помити посуд після годування #{@name}(а)"
    lifeTime
  end

  def washedPet
    @mood += 5
    lifeTime
    p "Ви вирішили помити вашу тваринку"
  end

  def caressPet
    @mood += 5
    lifeTime
    p "Набувши стану спокою після важкого дня, до вас підходить #{@name}"
    p " щоб дати заспокоїтись вам і отримати ласку до себе"
  end

  def wearPetBeforeWalk
    @mood += 3
    lifeTime
    p "Вдягаєте свого #{@name}(а) для прогулянки"
  end

  def status
    p "Ви нічого не робите, просто спостерігаєе за своєю тваринкою"
    lifeTime
  end

  private
  def hungry?
    @hungry_level <= 5
    p "потрібно негайно покормити тваринку інакше щось трапиться"
  end

  def poop?
    @poop >= 10
    p "#{@name} Потрібно відвести на горшок інакше він зробить щось погане!!!"
  end

  def play?
    @mood <= 5
    p "Потрібно погратися з Вашою тваринкою!!!"
    if @hungry_level < 10
      p "Спочатку потрібно покормити #{@name}"
      #p "#{@name} після прогулянки зголоднів."
    elsif @mood < 8
      p "#{@name} не задоволений . Пограйтесь ще!"
    end

  end

  def lifeTime
    if @hungry_level >= 1
      @hungry_level -= 1
    elsif @hungry_level == 0
      p "#{@name} дуже зголодав! Доведений до крайності він з'їдає ВАС!!!"
      exit
    end
    if @mood >= 1
      @mood -= 1
    elsif @mood == 0
      p "#{@name} від нудьги тікає від вас"
      exit
    end
    if @poop >= 5
      @mood -= 4
      p "#{@name} Потрібно відвести на горшок інакше він зробить щось погане!!!"
    end
    if @mood <= 3
      @mood = 0
      p "Отакої! #{@name} зробив щось погане..."
      p "Потрібно приділити увагу улюбленцю, покормити чи погуляти, щоб підняти настрій"
    end

    if hungry?
      if @sleep
        @sleep = false
        p "Несподівано прокидається!"
      end
      p "У шлунку #{@name}(а) гурчить..."

      if @hungry_level == 50
        p "#{@name} не голодний!"
      else
        @mood += 3
        @hungry_level += 3
        lifeTime
      end
    end

    if poop?
      if @sleep
        @sleep = false
        p "Він несподівано прокидається!"
      end
      if poop >= 10
        p "#{@name}  стрибає бо хоче на горшок..."
      end
    end

  end




end
class Cat < Animal
  @mood = 45
  @life = 3
  @hungry_level = 45
  @sleep = false
  @poop = 35
end
class Dog < Animal
  @mood = 50
  @life = 3
  @hungry_level = 50
  @sleep = false
  @poop = 50
end
class Bird < Animal
  @mood = 35
  @life = 3
  @hungry_level = 40
  @sleep = false
  @poop = 40
end


puts "Для початку гри напишіть слово start"
input = gets.chomp
if input == "start"
  p "Оберіть тваринку 1 Кіт, 2 Собака, 3 Пташка"
  user_input_animal_type = gets.chomp.to_i
  p "Давайте дамо і'мя вашій тваринці"
  pet_name = gets.chomp
  if user_input_animal_type == 1
    pet = Cat.new(pet_name)
  elsif user_input_animal_type == 2
    pet = Dog.new(pet_name)
  else
    pet = Bird.new(pet_name)
  end

  p 'Вашу тваринку створено, давайте подивимось, що можна з ним робити'
  p "Напишіть команду help для виводу всіх доступних команд"
end

loop do
user_input = gets.to_s.downcase.chomp
counter = 0
  if user_input == "help"
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
    if counter > 3
      break
    end
  end
end

