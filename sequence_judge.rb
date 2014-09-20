require_relative "sequence_generator"

class SequenceJudge

  def initialize(guess_sequence, solution_sequence)
    @guess_sequence = guess_sequence
    @solution_sequence = solution_sequence
  end

  def compare

  end

end

# -checks input against solution sequence
# -makes sure input conforms to difficulty level
# -generates number of colors correct and/or in the correct position


solution = SequenceGenerator.new("beginner")
solution.generate_sequence
solution_sequence = solution.solution_sequence
