require 'pry'

class Cli

  def run
    start
  end

  def self.display
    monkeys = "🐵  " * 15
    sticks = "🏒  " * 15
    puts monkeys + "\n" * 2
    puts "This program is for you: the person who would like to browse the first 20 blockers on sale at GoalieMonkey.com without looking at pictures of them." + "\n" * 2
    puts sticks  + "\n" * 2
    puts "For a given blocker, enter the number (1-20) for which you'd like to see more info, including it's price and webpage:"
    puts "\n" *2


  end


end

Cli.display
