#blackjack
class Blackjack
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
    @hand = @cards.sample(2)
    puts "Player Hand:> #{@hand}"
    hit_stand
  end

  def hit_stand
    print "\nWhat would you like to do: \n\t1:> Hit\n\t2:> Stand\n > "
    @response = gets.chomp.to_i
      if @response == 1
        new_card
      elsif @response == 2
        puts  "Player Stands"
        30.times{print "="}
        puts "\n #{@hand}"
        30.times{print "="}
        print "\n"
        value
      end
  end

  def new_card
      new_card = @cards.sample(1) #taken random card from cards
      @hand << new_card #insert random card into hand
      @hand.flatten! #flatten array from insertion of new card
      30.times{print "="}
      print "\n"
      puts "Player Hand> {#@hand}\n\n"
      hit_stand
  end

  def value
    #puts "~~#{@hand}~~" #only used for testing
    hand_value = Array.new
    @hand.each {|x| hand_value << @card_value[x]}
    @score = hand_value.sum #score of players hand
    return @score
  end
end

class Dealer < Blackjack
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
    @hand = @cards.sample(1)
    puts "Dealer Hand:> ""#{@hand}, ['*']\n\n" # dealer only shows 1 card
  end

  def hit_stand
    value
  end

  def new_card
      new_card = @cards.sample(1) #taken random card from cards
      @hand << new_card #insert random card into hand
      @hand.flatten! #flatten array from insertion of new card
      print "\n"
      puts "Dealer Hand> {#@hand}\n"
      value
  end

  def value
    #puts "~~#{@hand}~~" #only used for testing
    hand_value = Array.new
    @hand.each {|x| hand_value << @card_value[x]} # insert value of each card into hand_value array
    @score = hand_value.sum #score of players hand derived from card_value hash
    return @score
  end
end

class Engine
  def play()
  player = Blackjack.new
  dealer = Dealer.new
  puts "Dealer"
  dealer.hand
  puts "Player"
  player.hand
  puts "Dealer"
  dealer.new_card
  dealer.hit_stand
  print "\n"
  until dealer.value > 17 || player.value > 21
    dealer.new_card
    dealer.value
  end
  print "\nPlayer:> #{player.value}"
  puts "\nDealer:> #{dealer.value}\n\n"
    if dealer.value > player.value && dealer.value <= 21 || player.value > 21
      puts "<<<DEALER WINS>>>\n"
    elsif dealer.value < player.value && player.value <= 21 || dealer.value > 21 && player.value <= 21
      puts "<<<PLAYER WINS>>>\n"
    else
      puts "Push"
    end
  return replay
  end

  def replay
    puts "Would you like to play again?"
    puts "1:> Yes 2:> No"
    response = $stdin.gets.chomp
    if response.upcase == "Y" || response.upcase == "YES" || response == '1'
      return play
    else
      puts "Have a great day."
    end
  end
end

player = Engine.new
player.play
