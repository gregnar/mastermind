require_relative 'mastermind'
MasterMind.new.start

loop do
  MasterMind.new.play_again
end
