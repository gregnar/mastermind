class SequenceGenerator
  def initialize(difficulty)
    @difficulty = difficulty
  end

  def generate_sequence
    case @difficulty
    when "beginner" then beginner
    when "intermediate" then intermediate
    when "advanced" then advanced
    end
  end

  def beginner
  end

  def intermediate
  end

  def advanced
  end

end
