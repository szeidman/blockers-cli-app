class Blockers::CLI

  def display
    monkeys = "🐵  " * 15
    sticks = "🏒  " * 15
    puts monkeys + "\n" * 2
    puts "Finally a program for you, someone who wants to see the 20 cheapest senior-sized blockers  at GoalieMonkey.com without necessarily looking at pictures of them." + "\n" * 2
    puts sticks  + "\n" * 2

  end

  def blocker_list
    puts "Here are the blockers (cheapest one first):\n\n"
    Blockers::Blocker.all.each_with_index do |blocker, i|
      puts "#{i + 1}. #{blocker.name}"
    end
  end

  def blocker_info(item)
    puts "\n🐒🐒           🐒🐒           🐒🐒           🐒🐒           🐒🐒"
    puts "\nYou chose the #{item.name.strip}."
    puts "It's listed for #{item.price}."
    puts "Buy it here: \n#{item.url}"
    puts "\n🐒🐒           🏒🏒            🐒🐒          🏒🏒           🐒🐒"
    puts "\nTo regenerate the list, type 'list'.\nTo exit, type 'exit'."
    input = gets.strip.downcase
    while input != "exit" && input != "list"
      puts "🙉 Invalid response; to return to the list, type 'list.'\nTo exit, type 'exit'."
      input = gets.strip.downcase
    end
    if input == "exit"
      puts "🙈  So long. Keep blocking the pucks. 🙈"
    elsif input == "list"
      Blockers::Blocker.delete
      commence
    end
  end

  def commence
    Blockers::Blocker.scrape
    display
    blocker_list
    input = nil
    puts "\n🏒 🐵 🏒 🏒 🐵 🐵 🐵 🏒 🏒 🏒 🏒 🏒 🏒 🏒 🏒 🏒 🏒 🐵 🐵 🐵 🏒 🏒 🐵 🏒"
    puts "\nEnter a blocker's number (1-20) for more info:"
    input = gets.strip.to_i
    while !input.between?(1, 20)
      puts "🙊 Invalid response; please enter the number (1-20) for which you'd like to see more info: "
      input = gets.strip.to_i
    end
    index = input - 1
    item = Blockers::Blocker.find(index)
    blocker_info(item)
  end

end
