class Turn
  attr_reader :current_player, :current_question

  def initialize (players, questions)
    @players = players
    @questions = questions
    @round = 0
  end  

  def get_current_player
    @players.select.first
  end

  def get_current_question
    @questions.select.first
  end

  def next_round
    @round += 1
    puts "-----NEW TURN-----"
    @players.rotate!
    @questions.rotate!
  end

end
