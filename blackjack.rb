#blackjack
class Blackjack
  def initialize(name)
    @name = name
  end
  def hand()
    @cards = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2']
    @card_value = {
      'A' => 11,
      'K' => 10,
      'Q' => 10,
      'J' => 10,
      '10' => 10,
      '9' => 9,
      '8' => 8,
      '7' => 7,
      '6' => 6,
      '5' => 5,
      '4' => 4,
      '3' => 3,
      '2' => 2
    }
    @hand = @cards.sample(1) + @cards.sample(1)
    print "Cards:> #{@hand}"
    return @hand
  end

  def hit_stand
    puts "What would you like to do: \n\t1:> Hit\n\t2:> Stand"
    @response = gets.chomp.to_i
      if @response == 1
        new_card
      elsif @response == 2
        puts  "You are standing"
        puts "|||#{@hand}|||"
        value
      end
  end

  def new_card
  #  if @response == 1
      new_card = @cards.sample(1)
      @hand << new_card
      20.times{print "="}
      print "\n"
      puts "Hand {#@hand}"
      hit_stand
  #  elsif @response == 2
  #    puts "You are standing"
  #  else
  #    puts "Invalid response please select 1 or 2"
  #  end
  end

  def value
    @hand.flatten! #need to flatten the array because multiple arrays are being created
    puts "~~#{@hand}~~"
    @hand.each {|x| puts @card_value[x]}
  end
end


p1 = Blackjack.new("Trevor")
p1.hand
p1.hit_stand
