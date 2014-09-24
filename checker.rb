class GuessChecker

  attr_reader :solution_sequence,
              :guess,
              :correct_elements,
              :correct_position

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

    guess_sequence.each do |color|
      if duplicate_solution.include?(color)
        @correct_elements_counter += 1
        duplicate_solution.delete_at(duplicate_solution.index(color))
      end
    end
    @correct_elements_counter
  end


  def find_correct_position(guess_sequence)
    @solution_array
    guess_sequence.each_with_index do |color, i|
      @correct_position_counter += 1 if color == @solution_array[i]
    end
    @correct_position_counter
  end

  def reset
    @correct_elements_counter = 0
    @correct_position_counter = 0
  end

end
