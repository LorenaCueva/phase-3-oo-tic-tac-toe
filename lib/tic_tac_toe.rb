
class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]]

    attr_accessor :board

    def initialize
        @board = Array.new 9
        @board.fill(" ") 
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(num)
        num.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " " ? true : false
    end

    def valid_move?(index)
        if index.between?(0,8)
            !position_taken?(index)
        end
    end

    def turn_count
        @board.select{|i| i != " "}.length
    end

    def current_player
        if turn_count == 0 
            "X"
        else
            turn_count % 2 == 0 ? "X" : "O"
        end
    end

    def turn
        puts "Please enter a number (1-9):"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
          token = current_player
          move(index, token)
        else
          turn
        end
        display_board
      end

    def won?
        WIN_COMBINATIONS.any? do |combo|
          if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
            return combo
          end
        end
      end

    def full?
        @board.all? {|play| play != " "}
    end

    def draw?
        full? && !won?
    end

    def over? 
        won? || draw?
    end

    def winner
        if won?
            turn_count % 2 == 0 ? "O" : "X"
            
        end
    end

    def play 
        while !over? do
            turn
        end
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

    # game = TicTacToe.new
    # game.play 

end

