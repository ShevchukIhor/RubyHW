class Pet
	def initialize(name)
		@name = name
		@life = 3
		@mood = 20
		@hungry = 20
		@asleep = false
		@poo = 0
	end

	def feed
		p "Ви кормите #{@name}(а)."
    	@mood += 2
			@hungry += 2
		lifeTime
	end
	
	def sleep
		p "Ви вкладаєте #{@name}(а) спати."
    @asleep = true
    3.times do
      if @asleep
				lifeTime
      end
      if @asleep
        p "#{@name} гучно сопе ..."
      end
    end
    if @asleep
      @asleep = false
      p "#{@name} повільно прокидається."
    end
	end

	def play
	  p "Ви вийшли на прогулянку з #{@name}(м)."
    @mood = 10
    @poo = @poo + 5
		lifeTime
    if @hungry < 10
    	p "#{@name} після прогулянки зголоднів."
    elsif @mood < 8
    	p "#{@name} не задоволений прогулянкою. Пограйтесь ще!"
    end
	end

	def poopy
		@poo -= 3 
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
		@mood += 2
		lifeTime
		p "Ви вирішили помити вашу тваринку"
	end

	def caressPet
		@mood += 3
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
		p "Вам нічого не хочется робити, просто спостерігаєе за своєю тваринкою"
		lifeTime
	end

	def help
		p	"feed -- нагодувати тваринку"
		p "asleep -- вкласти спати"
		p "play -- погратись"
		p "poopy -- відвести тваринку на горшок"
		p "clean -- прибрати після того як тваринка сходила на горшок"
		p "clearPetSpot -- прибрати місце відпочинку"
		p "cleatPlateAfterFeed -- помити посуд після годування"
		p "washedPet -- покупати тварину"
		p "caressPet -- погладити тваринку"
		p "wearPetBeforeWalk -- вдягти для вигулу"
		p "status -- нічого не робитиб, спостерігати"
	end

private

	def hungry?
    @hungry <= 5
		p "потрібно негайно покормити тваринку інакше щось трапиться"
  end
  
  def poopy?  
    @poo >= 10
		p "#{@name} Потрібно відвести на горшок інакше він зробить щось погане!!!"
	end

	def play?
		@mood <= 5
		"Потрібно погратися з Вашою тваринкою!!!"
	end

  def lifeTime
		if @hungry > 0
			@hungry -= 1
		elsif @hungry == 0
			p "#{@name} дуже зголодав! Доведений до крайності він з'їдає ВАС!!!"
			exit
		end
		if @mood > 0
		@mood -= 1
		elsif @mood == 0
			p "#{@name} від нудьги тікає від вас"
			exit
		end
		if @poo > 5
			@mood -= 4
			p "#{@name} Потрібно відвести на горшок інакше він зробить щось погане!!!"
		end
    if @mood <= 5
      @mood = 0
      p "Отакої! #{@name} зробив щось погане..."
			p "Потрібно приділити увагу улюбленцю, покормити чи погуляти, щоб підняти настрій"
    end
    
    if hungry?
      if @asleep
        @asleep = false
        p "Несподівано прокидається!"
      end
			p "У шлунку #{@name}(а) гурчить..."
    end
    
    if poopy?
      if @asleep
        @asleep = false
        p "Він несподівано прокидається!"
			end
			if poopy >= 10
        p "#{@name}  стрибає бо хоче на горшок..."
			end
    end
	end
end



