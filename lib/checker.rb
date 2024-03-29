class GuessChecker
  attr_reader :solution_sequence,
              :guess,
              :correct_elements,
              :correct_position,
              :correct_elements_counter,
              :correct_position_counter


  def initialize(solution_sequence)
    @solution_sequence = solution_sequence
    @correct_elements_counter = 0
    @correct_position_counter = 0
  end

  def check_guess(guess)
    @solution_array = solution_sequence.split("")
    @guess_array = guess.split("")

    @correct_elements = find_correct_elements(@guess_array)
    @correct_position = find_correct_position(@guess_array)
  end

  def find_correct_elements(guess_sequence)
    duplicate_solution = @solution_array.dup

    num_count = guess_sequence.count do |color|
      next unless index = duplicate_solution.index(color)
      duplicate_solution.delete_at(index)
    end
    num_count
  end


  def find_correct_position(guess_sequence)
    @solution_array
    guess_sequence.each_with_index do |color, i|
      @correct_position_counter += 1 if color == @solution_array[i]
    end
    correct_position_counter
  end

  def reset
    @correct_elements_counter = 0
    @correct_position_counter = 0
  end
end
