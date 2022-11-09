class Animal
  attr_accessor :mood, :life, :hungry_level, :sleep, :poop

  def initialize(name)
    @name = name
    @mood = 30
    @life = 3
    @hungry_level = 30
    @sleep = false
    @poop = 10
  end

  def help
    p 'start -- початкова команда для запуску програми'
    p	'feed -- нагодувати тваринку'
    p 'sleep -- вкласти спати'
    p 'play -- погратись'
    p 'poop -- відвести тваринку на горшок'
    p 'clean -- прибрати після того як тваринка сходила на горшок'
    p 'clear_pet_spot -- прибрати місце відпочинку'
    p 'clear_plate_after_feed -- помити посуд після годування'
    p 'washed_pet -- покупати тварину'
    p 'caress_pet -- погладити тваринку'
    p 'wear_pet_before_walk -- вдягти для вигулу'
    p 'status -- нічого не робитиб, спостерігати'
    p 'введіть обрану команду'
  end

  def feed
    p "Ви кормите #{@name}(а)."
    @mood += 5
    @hungry_level += 25
    life_time
  end

  def asleep
    p "Ви вкладаєте #{@name}(а) спати."
    @sleep = true

    3.times do

      if @sleep
        life_time
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
    life_time
    p 'і через деякий час повертаєтесь'
  end

  def poop
    @poop -= 40
    p "Ви відвели #{@name} деб він зміг опорожнитися"
    p "Потрібно прибрати за #{@name}(м)."
    life_time
  end

  def clean
    p "Ви прибираєте купу після того як #{@name} опорожнив свій кишечник"
    life_time
  end

  def clear_pet_spot
    p "прибираєте улюблене місце вашого #{@name}(а)"
    life_time
  end

  def clear_plate_after_feed
    p "Необхідно помити посуд після годування #{@name}(а)"
    life_time
  end

  def washed_pet
    @mood += 5
    life_time
    p 'Ви вирішили помити вашу тваринку'
  end

  def caress_pet
    @mood += 5
    life_time
    p "Набувши стану спокою після важкого дня, до вас підходить #{@name}"
    p ' щоб дати заспокоїтись вам і отримати ласку до себе'
  end

  def wear_pet_before_walk
    @mood += 1
    life_time
    p "Вдягаєте свого #{@name}(а) для прогулянки"
  end

  def status
    p 'Ви нічого не робите, просто спостерігаєте за своєю тваринкою'
    life_time
  end

  private

  def hungry_level?

    if @hungry_level < 10
    p 'потрібно негайно покормити тваринку інакше щось трапиться'
    end

  end

  def poop?

    if @poop >= 50
    p "#{@name} Потрібно відвести на горшок інакше він зробить щось погане!!!"
    end

  end

  def play?

    if @hungry_level < 10
      p "Спочатку потрібно покормити #{@name}"
    elsif @mood < 8
      p "#{@name} не задоволений . Пограйтесь ще!"

    end

  end

  def life_time
    @hungry_level -= 5
    @mood -= 2
    @poop += 2

    if @hungry_level < 1
      @hungry_level -= 1
    elsif @hungry_level == 0
      p "#{@name} дуже зголодав! Доведений до крайності він з'їдає ВАС!!!"
      exit
    end

    if @mood < 1
      @mood -= 1
    elsif @mood == 0
      p "#{@name} від нудьги тікає від вас"
      exit
    end

    if @poop >= 55
      @mood -= 10
      p "#{@name} Потрібно відвести на горшок інакше він зробить щось погане!!!"
    end

    if @mood < 3
      @mood = 0
      p "Отакої! #{@name} зробив щось погане..."
      p 'Потрібно приділити увагу улюбленцю, покормити чи погуляти, щоб підняти настрій'
    end

  end
end

class Cat < Animal
  @mood, @life, @hungry_level, @poop = 25, 3, 25, 10
end

class Dog < Animal
  #default attributes
end

class Bird < Animal
  @mood, @life, @hungry_level, @poop = 30, 3, 30, 10
end

p 'Для початку гри напишіть слово start'

loop do
  input = gets.chomp.strip

  if input == 'start'
    break
  else
    p 'Ви ввели не вірну команду, вірна команда start'
  end

end

  p 'Давайте дамо твариці ім\'я'
  pet_name = gets.chomp.strip
  p 'Оберіть тваринку 1 Кіт, 2 Собака, 3 Пташка'

  case gets.chomp.to_i
  when 1
    pet = Cat.new(pet_name)
  when 2
    pet = Dog.new(pet_name)
  when 3
    pet = Bird.new(pet_name)
  else
    p 'Такої тваринки не має'
  end

p 'Вашу тваринку створено, давайте подивимось, що можна з ним робити'
  p 'Напишіть команду help для виводу всіх доступних команд'

counter = 0
loop do

  case gets.to_s.downcase.chomp.strip
  when 'help'
      pet.help
  when 'feed'
      pet.feed
  when 'sleep'
      pet.sleep
  when 'play'
      pet.play
  when 'poop'
      pet.poop
  when 'clean'
      pet.clean
  when 'clear_pet_spot'
      pet.clear_pet_spot
  when 'clear_plate_after_feed'
      pet.clear_plate_after_feed
  when 'washed_pet'
      pet.washed_pet
  when 'caress_pet'
      pet.caress_pet
  when 'wear_pet_before_walk'
      pet.wear_pet_before_walk
  when 'status'
      pet.status
  else
    counter += 1
      p 'Введіть вірну команду або для довідки введіть help'
  end

  if counter > 3
    break
  end

end



