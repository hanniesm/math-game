class Player

  attr_reader :name
  attr_accessor :lives

  def initialize (name)
    @name = name
    @lives = 3
  end

  def status
    print "#{name}: #{lives}/3"
  end

  def die
    @lives -= 1
  end

  def dead?
    lives == 0
  end

end