WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
MAX_TURNS = 9

def display_board (board = [9, " "])
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, token = current_player(board))
  board[location.to_i-1] = token
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input)
  else
    turn(board)
  end
  display_board(board)
end

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def full?(board)
  if board.any?{|element| element == " "}
    false
  else
    true
  end
end


def draw?(board)
  
end

def over?(board)
  if board.any?{|item| item == " "} == true
    false
  else
    true
  end
end

def winner(board)
  return board[won?(board)[0]]
end

def won?(board)
  false
  WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3
  if position_1 != " " && position_1 == position_2 && position_2 == position_3
    return win_combination # return the win_combination indexes that won.
  else
    false
  end
  end
end

def turn_count(board = [9, " "])
  counter = 0
  board.each do |element|
    if element == "X" || element == "O"
      counter += 1
    end
end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def play(board)
until over?(board) == true
     turn(board)
  end
end