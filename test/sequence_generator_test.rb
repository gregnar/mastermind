require_relative 'test_helper'
require '../lib/sequence_generator'

class SequenceGeneratorTest < Minitest::Test

  def test_different_beginner_sequences
    sequence = SequenceGenerator.new("beginner")
    sequence.generate_sequence
    assert sequence.solution_sequence.length == 4

    sequence2 = SequenceGenerator.new("beginner")
    sequence2.generate_sequence
    assert sequence2.solution_sequence.length == 4

    refute sequence.solution_sequence == sequence2.solution_sequence
  end

  def test_different_intermediate_sequences
    sequence = SequenceGenerator.new("intermediate")
    sequence.generate_sequence
    assert sequence.solution_sequence.length == 6

    sequence2 = SequenceGenerator.new("intermediate")
    sequence2.generate_sequence
    assert sequence2.solution_sequence.length == 6

    refute sequence.solution_sequence == sequence2.solution_sequence
  end

  def test_different_advanced_sequences
    sequence = SequenceGenerator.new("advanced")
    sequence.generate_sequence
    assert sequence.solution_sequence.length == 8

    sequence2 = SequenceGenerator.new("advanced")
    sequence2.generate_sequence
    assert sequence2.solution_sequence.length == 8

    refute sequence.solution_sequence == sequence2.solution_sequence
  end

end
