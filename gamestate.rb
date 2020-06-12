# frozen_string_literal: true

# *****************************************************************************
# GameState - Data for the game's state and APIs to mutate that state. 
class GameState
  def initialize
    @state = {}
    @state[:num_of_turns] = 0
    @state[:is_x_turn] = false
    @state[:initial_board] = [nil, nil, nil, nil, nil, nil, nil, nil, nil]    
  end

  # Initial turn assignment
  def assign_turn(user_input)
    @state[:is_x_turn] = user_input == 'x'
  end

  # Getters
  def get_board
    @state[:initial_board]
  end

  def get_turn
    @state[:is_x_turn] ? 'X' : 'O'
  end

  # Sets a spot on the board
  def set_spot(user_choice)
    @state[:initial_board][user_choice - 1] = self.get_turn
  end

  # Increments the number of turns
  def increment_turn_count
    @state[:num_of_turns] += 1
  end

  # Flips the turn
  def change_turn
    @state[:is_x_turn] = !@state[:is_x_turn]
  end
end
# *****************************************************************************
