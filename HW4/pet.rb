require_relative './lib/main_app'
class Pet

  attr_accessor :name
  attr_reader :mood, :hungry, :life

  def initialize(name)
    @name = name
    @life = 3
    @mood = 10
    @hungry = 50
  end

=begin
  def about
    p 'feed -- to feed your pet'
    p 'hug -- to hug your pet'
    p 'play -- to play whit pet'
    p 'end_game -- to euthanasia your pet if you want end of game or create new pet'
  end
=end

  def play
    @mood += 2
    @hungry -= 5
    time_life
  end

  def hug
    @mood += 10
    @hungry -= 2
    time_life
  end

  def feed
    @mood += 1
    @hungry += 5
    time_life
  end

  def end_game
    @life = 0
  end

  private

  def time_life
    @mood -= 1
    @hungry -= 2

    if @mood < 5 && @hungry < 25
      @mood -= 1
      @hungry -= 1
    end

    if @mood.negative? || @hungry.negative?
      @life -= 1
    elsif @life.zero?
      response_rack('end_of_game.html.erb')
    end
  end

end
