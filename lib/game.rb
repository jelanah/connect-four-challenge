require_relative 'board'

# This class is for initializing and running a game. It will
# need a new board and a way to keep track of who is the
# current player. The rest is up to you:
class Game
  def initialize
    @board = Board.new
    @current_player = :black
    
    
  end

  
  def start
    puts 'A new game has begun!'

    # Runs the game until there is a winner.
    until @board.game_won?()
      puts "Hey " + @current_player.to_s + ", it's your turn. Which column do you want to place the checker?"
      col = gets.chomp.to_i
      
    
      if @board.drop_checker(@current_player,col) == true
       
        # change player
        if @current_player == :black
          @current_player = :red
        else
        @current_player = :black
        end

      end

      
    end
  end 
end
