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
    puts "Cards:> #{@hand}"
  end

  def hit_stand
    puts "What would you like to do: \n\t1:> Hit\n\t2:> Stand"
    @response = gets.chomp.to_i
      if @response == 1
        new_card
      elsif @response == 2
        puts  "You are standing"
        30.times{print "="}
        puts "\n #{@hand}"
        30.times{print "="}
        print "\n"
        value
      end
  end

  def new_card
      new_card = @cards.sample(1) #taken random card from cards
      @hand << new_card
      @hand.flatten! #flatten array from insertion of new card
      30.times{print "="}
      print "\n"
      puts "Hand> {#@hand}"
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




player = Blackjack.new
dealer = Dealer.new
player.hand
dealer.hand
player.hit_stand
print "\nPlayer:> #{player.value}"
puts "\nDealer:> #{dealer.value}\n\n"
  if dealer.value > player.value && dealer.value <= 21 || player.value > 21
    puts "<<<DEALER WINS>>>\n"
  elsif dealer.value < player.value && player.value <= 21 || dealer.value > 21 && player.value < 21
    puts "<<<PLAYER WINS>>>\n"
  else
    puts "Push"
  end
