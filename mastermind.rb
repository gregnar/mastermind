require './lib/CLI'
CLI.new.start

loop do
  CLI.new.play_again
end
