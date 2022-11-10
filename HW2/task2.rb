class Animal
  attr_accessor :mood, :life, :hungry_level, :sleep, :poop

  HUNGRY_MAX = 40
  MOOD_MAX = 30
  POOP_MAX = 30

  def initialize(name)
    @name = name
    @mood = 20
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
    p 'status -- нічого не робити, спостерігати'
    p 'введіть обрану команду'
  end

  def feed
    p "Ви кормите #{@name}(а)."

    if @mood <= MOOD_MAX && @hungry_level < HUNGRY_MAX
    @hungry_level += 5
    @mood += 5
    life_time
    else
      p "#{@name} не голодний"
    end

    if @hungry_level < 10
      p 'потрібно негайно покормити тваринку інакше щось трапиться'
    end

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

    if @sleep
      @hungry_level < 10
      @sleep = false
      p 'Несподівано прокидаєтсья, бо хоче їсти'
    end

    if @poop > 40
      p 'Несподівано прокидажтсья, бо хоче на горшок'
    end

  end

  def play
    p "Ви вийшли на прогулянку з #{@name}(м)."
    p 'і через деякий час повертаєтесь'
    @poop += 5
    @mood += 5
    @hungry_level -= 5
    life_time

    if @mood < 8
      p "#{@name} не задоволений . Пограйтесь ще!"
    end

    if @hungry_level < 17
      p "Спочатку потрібно покормити #{@name}"
    end

    if @poop > 25
      p "#{@name}(а) потрібно відвести на горщик"
    end

  end

  def is_poop
    @poop = 0
    p "Ви відвели #{@name} деб він зміг опорожнитися"
    p "Потрібно прибрати за #{@name}(м)."
    life_time

    if @poop == POOP_MAX
      p "#{@name} Потрібно відвести на горшок інакше він зробить щось погане!!!"
    end

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
    p 'Ви вирішили помити вашу тваринку'
    life_time
  end

  def caress_pet
    p "Набувши стану спокою після важкого дня, до вас підходить #{@name}"
    p ' щоб дати заспокоїтись вам і отримати ласку до себе'
    life_time
  end

  def wear_pet_before_walk
    p "Вдягаєте свого #{@name}(а) для прогулянки"
    life_time
  end

  def status
    p 'Ви нічого не робите, просто спостерігаєте за своєю тваринкою'
    life_time
    p "Настрій #{@mood}"
    p "Рівень голоду #{@hungry_level}"
    p "Наповненість кишечнику #{@poop}"
    p "Життів #{@life}"
  end

  private

  def life_time
    @hungry_level -= 2
    @mood -= 2
    @poop += 2

    if @poop == POOP_MAX
      @mood -= 3
      p "#{@name} Потрібно відвести на горшок інакше він зробить щось погане!!!"
    end

    if @mood < 10 || @hungry_level < 10
      @mood = 6
      p "Отакої! #{@name} зробив щось погане..."
      p 'Потрібно приділити увагу улюбленцю, покормити чи погуляти, щоб підняти настрій'
    end

    if @hungry_level < 2
      @hungry_level = 0
      p "#{@name} дуже зголодав! Доведений до крайності він померає!!!"
      @life -= 1
    elsif
      @life.zero?
      p 'У вас закінчилися життяю Ваша тваринка остаточно померла!'
      exit
    end

    if @mood < 2
      @mood = 0
      p "#{@name} від нудьги тікає від вас"
      @life -= 1
    elsif
    @life.zero?
      p 'У вас закінчилися життяю Ваша тваринка остаточно померла!'
      exit
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
  @mood, @life, @hungry_level, @poop = 20, 3, 20, 10
end

p 'Для початку гри напишіть слово start'

counter = 0
loop do
  counter +=1
  input = gets.chomp.strip

  if input == 'start'
    p 'Давайте дамо твариці ім\'я'
    break
  else
    p 'Ви ввели не вірну команду, вірна команда start'
  end

  if counter == 5
    exit
  end

end

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
  when 'asleep'
      pet.asleep
  when 'play'
      pet.play
  when 'is_poop'
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



