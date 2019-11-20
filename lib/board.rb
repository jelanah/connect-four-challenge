# Use this as a sketch of how your Board class could look, you can fill in these
# methods, or make a different class from scratch
require 'tty-table'

class Board
  attr_reader :table
  attr_accessor :rows

  def initialize
    generate_board
    print_grid
  end 

  # This method drops a checker down the column. 

  def drop_checker(color, column)

    if column < 0 || column > 6
      puts "Insert a column number 0-6!"
      return false
    end
    
    
    if color != :red && color != :black
      puts "Color must be red or black!"
      return false
    end
    
    5.downto 0 do |row| #Counts down to zero
      if rows[row][column].empty?
        if color == :black 
          rows[row][column] = "O"
        else
          rows[row][column] = "X"
        end
        print_grid
        return true
      end
    end
    
    puts "You can't put a checker in a full column!" 
    return false 
  end


  def generate_board
    rows = []
    6.times do
      rows << []
    end

    rows.each do |r|
      7.times do
        r << empty_string
      end
    end
    @rows = rows
  end

  def empty_string
    "".freeze
  end

  def headers
    [0, 1, 2, 3, 4, 5, 6]
  end

  def print_grid
    @table = TTY::Table.new headers, @rows
    puts @table.render(:ascii, padding: [1, 2, 1, 2])
  end

  def game_won?
    winner = false
    counter = 0
    color = ""
    # column= 4
  
    until winner
      5.downto(0) do |column| 
        y = column
        0.upto(5) do |x| 
          if (rows[y][x] != "") && (rows[y][x] == rows[y][x+1]) # checks if adjacent is equal
            counter+=1
            puts "counter: #{counter}"
          else
            counter = 0
            puts "counter else: #{counter}"
          end
          if counter == 3
            winner = true
            if rows[y][x] == "O" # to print the winner's color later
              color = "black"
            else
              color = "red"
            end
            puts "Congratulations, #{color}, you won!"
            return true
            # break
          end
        end
        # if winner == true
        #   puts "Congratulations, #{color}, you won!"
        #   return true
        # else
        return false
        # end
      end
    end
  end
end
