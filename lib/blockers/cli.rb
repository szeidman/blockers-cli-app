class Blockers::CLI

  def display
    monkeys = "🐵  " * 15
    sticks = "🏒  " * 15
    puts monkeys + "\n" * 2
    puts "This program is for you: the person who would like to browse the first 20 blockers on sale at GoalieMonkey.com without looking at pictures of them." + "\n" * 2
    puts sticks  + "\n" * 2

  end

  def blocker_list
    puts "Here they are!"
    Blockers::Blocker.all.each_with_index do |blocker, i|
      puts "#{i + 1}. #{blocker.name}"
    end
  end

  def blocker_info(item)
    puts "You have selected the #{item.name}."
    puts "This blocker is listed for #{item.price}."
    puts "More information available here: #{item.url}"
  end

  def commence
    Blockers::Blocker.scrape
    display
    blocker_list
    input = nil
    puts "For a given blocker, enter the number (1-20) for which you'd like to see more info, including its price and webpage: "
    input = gets.strip.to_i
    while !input.between?(1, 20)
      puts "Invalid response; please enter the number (1-20) for which you'd like to see more info, including its price and webpage: "
      input = gets.strip.to_i
    end
    index = input - 1 #change variable or use input_to_index method?
    item = Blockers::Blocker.find(index)
    blocker_info(item)
  end

end
