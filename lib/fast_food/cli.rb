#Our CLI controller
class FastFood::CLI

  def call
    puts "\n\n<<< Welcome to the Fast Food Nutrition Counter! >>>\n\n"
		puts "This is an interactive guide to keep you from eating junk.\n\n"
    menu
  end

  def menu
    puts "What fast food do you want to look up?\n"
    print "> "
    user_response = gets.chomp
    args = user_response.downcase.strip.split(' ')
    action = args.shift
    return action, args
  end

  def find(keyword="")
    if keyword
      restaurants = Restaurant.saved_restaurants
      found = restaurants.select do |rest|
        rest.name.downcase.include?(keyword.downcase) ||
        rest.cuisine.downcase.include?(keyword.downcase) ||
        rest.price.to_i <= keyword.to_i
      end
      output_restaurant_table(found)
    else
      puts "Sorry, that restaurant isn't in our system.\n"
      print "> "
    end
  end

end
