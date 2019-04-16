require_relative './player'
require_relative './turn'
require_relative './questions'

class Game

  def initialize
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
    @players = [@player1, @player2]
    @question1 = Question.new("What is 5 * 7", 35)
    @question2 = Question.new("What is 3 + 2", 5)
    @question3 = Question.new("What is 6 / 2", 3)
    @questions = [@question1, @question2, @question3]
    @turn = Turn.new(@players, @questions)
    
  end

  def summary
    print "#{@player1.status}"
    print " vs "
    print "#{@player2.status}"
    puts
  end

  def game_over?
    @players.select {|player| !player.dead?}.count == 1
  end

  def end_game
    winner = @players.select {|player| !player.dead?}.first
    puts "#{winner.name} wins with a score of #{winner.lives}"
    puts "------GAME OVER-------"
  end

  def run
    puts "New Game"
    until (game_over?)
      @turn.next_round
      current_player = @turn.get_current_player
      current_question = @turn.get_current_question
    #   #get the question and answer  
    
      puts "#{current_player.name}: #{current_question.question}"
      answer = gets.chomp.to_i
      if answer == current_question.answer
            puts "Yay well done"
      else puts "Seriously? #{answer} What were you thinking?"
        current_player.die
      end
      summary
    end

    end_game  

    end

  end

