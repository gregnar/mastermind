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

    sequence.chars.map! do |letter|
      color_key[letter]
    end

  end
end

string = "WPBGR"
puts string
string = Colors.make_pretty(string).join(" - ")
puts string
