class SequenceGenerator

  attr_reader :solution_sequence

  def initialize(difficulty)
    @difficulty = difficulty
    @possible_colors = ["R", "G", "B", "Y"]
    @solution_sequence = ""
  end

  def generate_sequence
    case @difficulty
    when "beginner" then beginner
    when "intermediate" then intermediate
    when "advanced" then advanced
    end
  end

  def generator_bot(sequence_length)
    sequence_length.times do
      @solution_sequence << @possible_colors.sample
    end
    @solution_sequence
  end

  def beginner
    generator_bot(4)
  end

  def intermediate
    @possible_colors << "W"
    generator_bot(6)
  end

  def advanced
    @possible_colors << "W"; @possible_colors << "P"
    generator_bot(8)
  end
end
