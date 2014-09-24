require "rainbow"

module Colors

  def self.make_pretty(sequence)
    color_key = {"Y" => Rainbow("Y").yellow.bright,
                "R" => Rainbow("R").red.bright,
                "G" => Rainbow("G").green.bright,
                "W" => Rainbow("W").white.bright,
                "P" => Rainbow("P").magenta.bright,
                "B" => Rainbow("B").blue.bright
                }

    new_sequence = sequence.chars.map! do |letter|
      color_key[letter]
    end
    new_sequence.join("-")
  end
end
