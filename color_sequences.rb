require "rainbow"  # => true


color_key = {"Y" => Rainbow("Y").yellow,  # => "Y"
            "R" => Rainbow("R").red,      # => "R"
            "G" => Rainbow("G").green,    # => "G"
            "W" => Rainbow("W").white,    # => "W"
            "P" => Rainbow("P").magenta,  # => "P"
            "B" => Rainbow("B").blue      # => "B"
            }                             # => {"Y"=>"Y", "R"=>"R", "G"=>"G", "W"=>"W", "P"=>"P", "B"=>"B"}


string = "GBYRWP"  # => "GBYRWP"

new_string = string.chars.map do |letter|  # => ["G", "B", "Y", "R", "W", "P"]
  color_key[letter]                        # => "G", "B", "Y", "R", "W", "P"
end                                        # => ["G", "B", "Y", "R", "W", "P"]

puts new_string.join("||")  # => "GBYRWP"
